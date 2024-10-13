import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:suimon/repositories/repositories.dart';

part 'location_tracking_event.dart';
part 'location_tracking_state.dart';

class LocationTrackingBloc extends Bloc<LocationTrackingEvent, LocationTrackingState> {
  final MiningRepository miningRepository;

  LocationTrackingBloc({ required this.miningRepository }) : super(LocationTrackingInitial()) {
    on<StartLocationTracking>((event, emit) async {
      await miningRepository.startTracking();
      await emit.forEach(miningRepository.location,
        onData: (position) {
          return LocationTrackingRunning(position: position);
        },
        onError: (e, stackTrace) {
          return LocationTrackingError(message: e.toString());
        });
    });

    on<StopLocationTracking>((event, emit) async {
      await miningRepository.stopTracking();
      emit(LocationTrackingInitial());
    });
  }
}
