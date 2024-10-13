part of 'location_permission_bloc.dart';

@immutable
sealed class LocationPermissionEvent {}

final class RequestLocationPermission extends LocationPermissionEvent {}
