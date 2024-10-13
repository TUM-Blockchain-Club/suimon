part of 'location_tracking_bloc.dart';

@immutable
sealed class LocationTrackingState {}

final class LocationTrackingInitial extends LocationTrackingState {}

final class LocationTrackingRunning extends LocationTrackingState {
  final Position position;

  LocationTrackingRunning({
    required this.position,
  });
}

final class LocationTrackingStopped extends LocationTrackingState {}

final class LocationTrackingError extends LocationTrackingState {
  final String message;

  LocationTrackingError({
    required this.message,
  });
}
