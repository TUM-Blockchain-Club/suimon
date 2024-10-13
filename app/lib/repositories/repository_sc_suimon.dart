// ignore_for_file: avoid_print
import 'package:sui/sui.dart';

class SCSuimonRepository {
  const SCSuimonRepository({
    required String packageId,
    required SuiClient client,
  })  : _packageId = packageId,
        _client = client;

  final String _packageId;
  final SuiClient _client;

  Future<void> mint() async {
    final suiObjects = await queryCoinObjects();

    if (suiObjects.isEmpty) {
      print("No SUI coin objects found for the given address.");
      return;
    }

    print(suiObjects[0].objectId);

    final txCall = MoveCallTransaction(
      _packageId,
      'challenge_response_kiosk',
      'purchase',
      [],
      [
        '0123456789',
        '0x08ed41da18e4497a197436929478be2d482c37e4072127d5828c1b4b6f140377',
        '0xa601c57b66f20ed06a5a26dd067c508358c8110eba181322caf7cc3dcee8f56a',
        '29528A5A7DE916DB8AE7A5854373B2ED3E47993F3AD49A75B7DF21136AEBE0BB',
        suiObjects[0].objectId
      ],
      100000000,
    );

    final mintResponse = await _client.executeMoveCall(txCall);
    print(mintResponse);
  }

  Future<void> transfer() async {}

  Future<List<SuiObject>> queryCoinObjects() async {
    final objectsResp = await _client.getOwnedObjects(
      _client.getAddress(),
      options: SuiObjectDataOptions(showType: true, showContent: true),
    );
    final coinObjects = objectsResp.data
        .where((obj) => obj.data?.type == "0x2::coin::Coin<0x2::sui::SUI>")
        .map((x) => x.data!)
        .toList();
    return coinObjects;
  }
}
