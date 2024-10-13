part of 'location_tracking_bloc.dart';

@immutable  
sealed class LocationTrackingEvent {}

final class StartLocationTracking extends LocationTrackingEvent {}

final class StopLocationTracking extends LocationTrackingEvent {}
