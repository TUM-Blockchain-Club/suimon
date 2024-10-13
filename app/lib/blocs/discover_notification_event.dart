part of 'discover_notification_bloc.dart';

@immutable
sealed class DiscoverNotificationEvent {}

final class StartDiscover extends DiscoverNotificationEvent {}

final class CatchDiscoveredSuimon extends DiscoverNotificationEvent {}

final class DiscardDiscoveredSuimon extends DiscoverNotificationEvent {}
