import 'package:freezed_annotation/freezed_annotation.dart';

part 'suimon.freezed.dart';
part 'suimon.g.dart';

@freezed
class Suimon with _$Suimon {
  factory Suimon({
    required int id,
    required String name,
    required String description,
    required String imageUri,
    required List<String> type,
    required int difficulty,
    required int maxMintPerEpoch,
  }) = _Suimon;

  factory Suimon.fromJson(Map<String, dynamic> json) => _$SuimonFromJson(json);
}
