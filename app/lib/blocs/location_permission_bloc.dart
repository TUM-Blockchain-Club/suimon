import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:suimon/repositories/repositories.dart';

part 'location_permission_event.dart';
part 'location_permission_state.dart';

class LocationPermissionBloc extends Bloc<LocationPermissionEvent, LocationPermissionState> {
  final MiningRepository miningRepository;

  LocationPermissionBloc({ required this.miningRepository }) : super(LocationPermissionInitial()) {

    on<RequestLocationPermission>((event, emit) async {
      var status = await miningRepository.requestLocationPermission();
      switch (status) {
        case LocationPermission.always:
        case LocationPermission.whileInUse:
          emit(LocationPermissionGranted());
          break;
        case LocationPermission.denied:
          emit(LocationPermissionDenied());
          break;
        case LocationPermission.deniedForever:
          emit(LocationPermissionDenied());
          break;
        case LocationPermission.unableToDetermine:
          emit(LocationPermissionUndecided());
          break;
      }
    });

  }
}
