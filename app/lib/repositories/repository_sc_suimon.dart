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

  Future<void> mint() async {

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
