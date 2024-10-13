import 'package:freezed_annotation/freezed_annotation.dart';

part 'suimon.freezed.dart';

@freezed
class Suimon with _$Suimon {
  factory Suimon({
    required int id,
    required String name,
    required String description,
    required String imageUrl,
    required int maxMintPerEpoch,
    required int difficulty,
    required List<int> prevolutions,
  }) = _Suimon;
}
