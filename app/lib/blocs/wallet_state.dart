part of 'wallet_bloc.dart';

@immutable
sealed class WalletState {}

class WalletInitial extends WalletState {}

class WalletConnected extends WalletState {
  final SuiAccount account;
  final SuiClient client;

  WalletConnected(this.account, this.client);
}
