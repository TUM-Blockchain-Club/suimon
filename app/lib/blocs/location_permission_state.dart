part of 'location_permission_bloc.dart';

@immutable
sealed class LocationPermissionState {}

final class LocationPermissionInitial extends LocationPermissionState {}

final class LocationPermissionGranted extends LocationPermissionState {}

final class LocationPermissionDenied extends LocationPermissionState {}

final class LocationPermissionUndecided extends LocationPermissionState {}
