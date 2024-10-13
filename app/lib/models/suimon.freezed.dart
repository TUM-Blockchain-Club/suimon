// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suimon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Suimon _$SuimonFromJson(Map<String, dynamic> json) {
  return _Suimon.fromJson(json);
}

/// @nodoc
mixin _$Suimon {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUri => throw _privateConstructorUsedError;
  List<String> get type => throw _privateConstructorUsedError;
  int get difficulty => throw _privateConstructorUsedError;
  int get maxMintPerEpoch => throw _privateConstructorUsedError;

  /// Serializes this Suimon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Suimon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuimonCopyWith<Suimon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuimonCopyWith<$Res> {
  factory $SuimonCopyWith(Suimon value, $Res Function(Suimon) then) =
      _$SuimonCopyWithImpl<$Res, Suimon>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String imageUri,
      List<String> type,
      int difficulty,
      int maxMintPerEpoch});
}

/// @nodoc
class _$SuimonCopyWithImpl<$Res, $Val extends Suimon>
    implements $SuimonCopyWith<$Res> {
  _$SuimonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Suimon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUri = null,
    Object? type = null,
    Object? difficulty = null,
    Object? maxMintPerEpoch = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUri: null == imageUri
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      maxMintPerEpoch: null == maxMintPerEpoch
          ? _value.maxMintPerEpoch
          : maxMintPerEpoch // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuimonImplCopyWith<$Res> implements $SuimonCopyWith<$Res> {
  factory _$$SuimonImplCopyWith(
          _$SuimonImpl value, $Res Function(_$SuimonImpl) then) =
      __$$SuimonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String imageUri,
      List<String> type,
      int difficulty,
      int maxMintPerEpoch});
}

/// @nodoc
class __$$SuimonImplCopyWithImpl<$Res>
    extends _$SuimonCopyWithImpl<$Res, _$SuimonImpl>
    implements _$$SuimonImplCopyWith<$Res> {
  __$$SuimonImplCopyWithImpl(
      _$SuimonImpl _value, $Res Function(_$SuimonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Suimon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUri = null,
    Object? type = null,
    Object? difficulty = null,
    Object? maxMintPerEpoch = null,
  }) {
    return _then(_$SuimonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUri: null == imageUri
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      maxMintPerEpoch: null == maxMintPerEpoch
          ? _value.maxMintPerEpoch
          : maxMintPerEpoch // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuimonImpl implements _Suimon {
  _$SuimonImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUri,
      required final List<String> type,
      required this.difficulty,
      required this.maxMintPerEpoch})
      : _type = type;

  factory _$SuimonImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuimonImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String imageUri;
  final List<String> _type;
  @override
  List<String> get type {
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_type);
  }

  @override
  final int difficulty;
  @override
  final int maxMintPerEpoch;

  @override
  String toString() {
    return 'Suimon(id: $id, name: $name, description: $description, imageUri: $imageUri, type: $type, difficulty: $difficulty, maxMintPerEpoch: $maxMintPerEpoch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuimonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUri, imageUri) ||
                other.imageUri == imageUri) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.maxMintPerEpoch, maxMintPerEpoch) ||
                other.maxMintPerEpoch == maxMintPerEpoch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, imageUri,
      const DeepCollectionEquality().hash(_type), difficulty, maxMintPerEpoch);

  /// Create a copy of Suimon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuimonImplCopyWith<_$SuimonImpl> get copyWith =>
      __$$SuimonImplCopyWithImpl<_$SuimonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuimonImplToJson(
      this,
    );
  }
}

abstract class _Suimon implements Suimon {
  factory _Suimon(
      {required final int id,
      required final String name,
      required final String description,
      required final String imageUri,
      required final List<String> type,
      required final int difficulty,
      required final int maxMintPerEpoch}) = _$SuimonImpl;

  factory _Suimon.fromJson(Map<String, dynamic> json) = _$SuimonImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imageUri;
  @override
  List<String> get type;
  @override
  int get difficulty;
  @override
  int get maxMintPerEpoch;

  /// Create a copy of Suimon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuimonImplCopyWith<_$SuimonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
