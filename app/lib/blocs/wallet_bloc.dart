import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sui/sui_account.dart';
import 'package:sui/sui_client.dart';
import 'package:suimon/repositories/repositories.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository walletRepository;

  WalletBloc({required this.walletRepository}) : super(WalletInitial()) {
    on<WalletConnect>((event, emit) async {
      await walletRepository.connect();
      emit(WalletConnected(walletRepository.account, walletRepository.client));
    });

    on<WalletDisconnect>((event, emit) async {
      await walletRepository.disconnect();
      emit(WalletInitial());
    });
  }
}
