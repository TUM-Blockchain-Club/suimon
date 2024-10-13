import 'dart:math';

import 'package:sui/sui.dart';

class SCSuimonRepository {
  const SCSuimonRepository({
    required String packageId,
    required SuiClient client,
  }) : _packageId = packageId,
       _client = client;

  final String _packageId;
  final SuiClient _client;

  Future<bool> mint() async {
    final txCall = MoveCallTransaction(
      _packageId,
      'suimon',
      'mint',
      [],
      ['0x2::clock::Clock', '0xdee7ffd441dbc086c8fd384f3007e3eb780dcc21de8639f87692c2e0c94d0e1d', '0xcfd9885db80dc6f437056e5b71150d04a2dc0552183d778794da6a80c68bdbf1', '0x2::random::Random', '0x1', '0x212d4457550f258654a24a6871522797ab262dee4d7d1f89af7da90dc0904eac57ce183e6f7caca9a98755904c1398ff6288cec9877f98f2d3c776c448b9ad166839e09d77967b66129c4942eee6d3eaf4a0ce2a841acc873a46ae35e40f0088288d038857c70a1415300544d7cf376949a372049679afa35ee5206b58266184', '0x100'],
      10000000,
    );
    final mintRes = await _client.executeMoveCall(txCall);

    print("Mint Result: $mintRes");

    return true;
  }

  Future<void> transfer() async {

  }

  Future<List<SuiObject>> queryCoinObjects() async {
    final objectsResp = await _client.getOwnedObjects(
      _client.getAddress(),
      options: SuiObjectDataOptions(showType: true, showContent: true),
    );
    final coinObjects = objectsResp.data.where((obj) => obj.data?.type == "0x2::coin::Coin<0x2::sui::SUI>")
      .map((x) => x.data!).toList();
    return coinObjects;
  }
}
