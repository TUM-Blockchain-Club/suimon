part of 'wallet_bloc.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}

final class WalletConnected extends WalletState {
  final SuiAccount account;
  final SuiClient client;

  WalletConnected(this.account, this.client);
}
