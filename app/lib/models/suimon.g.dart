// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suimon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuimonImpl _$$SuimonImplFromJson(Map<String, dynamic> json) => _$SuimonImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      imageUri: json['imageUri'] as String,
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      difficulty: (json['difficulty'] as num).toInt(),
      maxMintPerEpoch: (json['maxMintPerEpoch'] as num).toInt(),
    );

Map<String, dynamic> _$$SuimonImplToJson(_$SuimonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUri': instance.imageUri,
      'type': instance.type,
      'difficulty': instance.difficulty,
      'maxMintPerEpoch': instance.maxMintPerEpoch,
    };
