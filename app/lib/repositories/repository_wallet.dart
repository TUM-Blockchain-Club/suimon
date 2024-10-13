import 'dart:async';

import 'package:sui/sui.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kWallet = 'private_key';

class WalletRepository {
   WalletRepository() {
    _init();
  }

  final Completer<SharedPreferences> _prefsCompleter = Completer<SharedPreferences>();

  late SuiAccount _account;
  SuiAccount get account => _account;

  late SuiClient _client;
  SuiClient get client => _client;

  Future<void> _init() async {
    var prefs = await SharedPreferences.getInstance();
    _prefsCompleter.complete(prefs);
  }

  Future<void> connect() async {
    var prefs = await _prefsCompleter.future;
    var privateKey = prefs.getString(_kWallet);
    if (privateKey != null) {
      _account = SuiAccount.fromPrivateKey(privateKey, SignatureScheme.Ed25519);
      print(account.getAddress());
      _client = SuiClient(SuiUrls.testnet, account: _account);
    } else {
      _account = SuiAccount.ed25519Account();
      _client = SuiClient(SuiUrls.testnet, account: _account);
      await prefs.setString(_kWallet, _account.privateKey());
    }
    // await requestFaucet();
  }

  Future<void> disconnect() async {

  }

  Future<void> requestFaucet() async {
    var res = await _client.getBalance(account.getAddress());
    var balance = res.totalBalance;
    if (balance <= BigInt.zero) {
      final faucet = FaucetClient(SuiUrls.faucetTest);
      await faucet.requestSuiFromFaucetV1(account.getAddress());
    }
  }
}
