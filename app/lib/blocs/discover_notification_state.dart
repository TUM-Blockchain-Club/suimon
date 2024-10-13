part of 'discover_notification_bloc.dart';

@immutable
sealed class DiscoverNotificationState {}

final class DiscoverInitial extends DiscoverNotificationState {}

final class DiscoverRunning extends DiscoverNotificationState {}

final class DiscoveredSuimon extends DiscoverNotificationState {
  final int suimonId;

  DiscoveredSuimon({
    required this.suimonId,
  });
}

final class CatchingSuimon extends DiscoverNotificationState {
  final int suimonId;

  CatchingSuimon({
    required this.suimonId,
  });
}

final class CaughtSuimon extends DiscoverNotificationState {
  final int suimonId;

  CaughtSuimon({
    required this.suimonId,
  });
}

final class DiscoverError extends DiscoverNotificationState {
  final String message;

  DiscoverError({
    required this.message,
  });
}
