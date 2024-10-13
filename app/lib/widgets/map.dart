import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:suimon/blocs/blocs.dart';

class SuimonMap extends StatefulWidget {
  const SuimonMap({super.key});

  @override
  State<SuimonMap> createState() => _SuimonMapState();
}

class _SuimonMapState extends State<SuimonMap> {
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final locationTrackingBloc = context.read<LocationTrackingBloc>();
    var initialCameraPosition = const CameraPosition(
      target: LatLng(37.7749, -122.4194),
      zoom: 18.0,
    );
    if (locationTrackingBloc.state is LocationTrackingRunning) {
      initialCameraPosition = CameraPosition(
        target: LatLng(
          (locationTrackingBloc.state as LocationTrackingRunning).position.latitude,
          (locationTrackingBloc.state as LocationTrackingRunning).position.longitude,
        ),
        zoom: 18.0,
      );
    }

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (GoogleMapController mapController) {
            _mapController.complete(mapController);
          },
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          fortyFiveDegreeImageryEnabled: true,
          rotateGesturesEnabled: true,
        ),
        Positioned.fill(
          child: BlocConsumer<LocationTrackingBloc, LocationTrackingState>(
            listener: (context, state) async {
              switch (state) {
                case LocationTrackingInitial():
                case LocationTrackingStopped():
                case LocationTrackingError():
                  break;
                case LocationTrackingRunning(position: var position):
                  var controller = await _mapController.future;
                  var latLang = LatLng(position.latitude, position.longitude);
                  controller.animateCamera(CameraUpdate.newLatLng(latLang));
                  initialCameraPosition = CameraPosition(
                    target: latLang,
                    zoom: 18.0,
                  );
                break;
              }
            },
            builder: (context, state) {
              return const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
