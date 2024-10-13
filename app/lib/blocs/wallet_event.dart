part of 'wallet_bloc.dart';

@immutable
sealed class WalletEvent {}

class WalletConnect extends WalletEvent {}

class WalletDisconnect extends WalletEvent {}
