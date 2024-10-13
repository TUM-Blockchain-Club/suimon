import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:poseidon/poseidon/poseidon.dart';
import 'package:rxdart/rxdart.dart';

class MiningRepository {
  MiningRepository() {
    _init();
  }

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.best,
    distanceFilter: 0,
  );

  final Completer<LocationPermission> _locationPermissionCompleter = Completer<LocationPermission>();
  Future<LocationPermission> get locationPermission => _locationPermissionCompleter.future;

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  StreamSubscription<ServiceStatus>? _serviceStatusStreamSubscription;
  StreamSubscription<Position>? _locationStreamSubscription;

  late BehaviorSubject<ServiceStatus> _serviceStatusSubject;
  Stream<ServiceStatus> get serviceStatus => _serviceStatusSubject.stream;

  late BehaviorSubject<Position> _locationSubject;
  Stream<Position> get location => _locationSubject.stream;

  StreamSubscription<Position>? _minerLocationSubscription;

  // Lifecycle methods --------------------------------------------

  void _init() {
    _serviceStatusSubject = BehaviorSubject<ServiceStatus>();
    _locationSubject = BehaviorSubject<Position>();
  }

  Future<void> dispose() async {
    await Future.wait([
      stopMining(),

      _serviceStatusSubject.close(),
      _locationSubject.close(),
    ]);
  }

  // Location methods --------------------------------------------

  Future<LocationPermission> requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      _serviceStatusSubject.add(ServiceStatus.disabled);

      return LocationPermission.unableToDetermine;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        _serviceStatusSubject.add(ServiceStatus.enabled);

        return LocationPermission.denied;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      _serviceStatusSubject.add(ServiceStatus.enabled);

      return LocationPermission.deniedForever;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _serviceStatusSubject.add(ServiceStatus.enabled);
    _locationPermissionCompleter.complete(permission);
    return permission;
  }

  Future<void> startTracking() async {
    // Request location permission
    var permission = await locationPermission;
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return;
    }

    // Start listening to service status stream
    _serviceStatusStreamSubscription ??= _geolocatorPlatform
        .getServiceStatusStream()
        .listen((ServiceStatus status) => _serviceStatusSubject.add(status),
    );

    // Start listening to location stream
    _locationStreamSubscription ??= _geolocatorPlatform
        .getPositionStream(locationSettings: locationSettings)
        .listen((Position position) => _locationSubject.add(position),
    );
  }

  Future<void> stopTracking() async {
    // Stop mining logic
    await stopMining();

    await Future.wait([
      if (_serviceStatusStreamSubscription != null) _serviceStatusStreamSubscription!.cancel(),
      if (_locationStreamSubscription != null) _locationStreamSubscription!.cancel(),
    ]);

    _serviceStatusStreamSubscription = null;
    _locationStreamSubscription = null;
  }
  
  // Mining methods --------------------------------------------

  void startMining() {
    startTracking();

    // mining logic
    _minerLocationSubscription = _locationSubject.listen((Position position) {
      // convert lat and long which are doubles combined into a big int without rounding
      BigInt lat = BigInt.from(position.latitude * 1000000);

      for (int i = 0; i < 19; i++) {
        // pos + seed + suimonId
        var hash = poseidon([BigInt.from(position.latitude + position.longitude), BigInt.from(123456789), BigInt.from(i)], {
          'C': ['1'],
          'M': ['1'],
        });

        if (hash < BigInt.from(1000000000000000000)) {
          print('Found a suimon with id $i!');
          break;
        }
      }
    });
  }

  Future<void> stopMining() async {
    // stop mining logic
  }

}
