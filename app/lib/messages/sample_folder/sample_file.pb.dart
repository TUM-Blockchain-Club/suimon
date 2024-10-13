// ignore_for_file: invalid_language_version_override

import 'dart:async';
import 'dart:typed_data';
import 'package:rinf/rinf.dart';

//
//  Generated code. Do not modify.
//  source: sample_file.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'sample_file.pbenum.dart';

export 'sample_file.pbenum.dart';

enum SampleInput_OneofInput {
  name, 
  age, 
  notSet
}

/// [DART-SIGNAL]
class SampleInput extends $pb.GeneratedMessage {
  factory SampleInput({
    Kind? kind,
    $core.String? name,
    $core.int? age,
  }) {
    final $result = create();
    if (kind != null) {
      $result.kind = kind;
    }
    if (name != null) {
      $result.name = name;
    }
    if (age != null) {
      $result.age = age;
    }
    return $result;
  }
  SampleInput._() : super();
  factory SampleInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SampleInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SampleInput_OneofInput> _SampleInput_OneofInputByTag = {
    2 : SampleInput_OneofInput.name,
    3 : SampleInput_OneofInput.age,
    0 : SampleInput_OneofInput.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SampleInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'sample_file'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..e<Kind>(1, _omitFieldNames ? '' : 'kind', $pb.PbFieldType.OE, defaultOrMaker: Kind.one, valueOf: Kind.valueOf, enumValues: Kind.values)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'age', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SampleInput clone() => SampleInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SampleInput copyWith(void Function(SampleInput) updates) => super.copyWith((message) => updates(message as SampleInput)) as SampleInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SampleInput create() => SampleInput._();
  SampleInput createEmptyInstance() => create();
  static $pb.PbList<SampleInput> createRepeated() => $pb.PbList<SampleInput>();
  @$core.pragma('dart2js:noInline')
  static SampleInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SampleInput>(create);
  static SampleInput? _defaultInstance;

  SampleInput_OneofInput whichOneofInput() => _SampleInput_OneofInputByTag[$_whichOneof(0)]!;
  void clearOneofInput() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Kind get kind => $_getN(0);
  @$pb.TagNumber(1)
  set kind(Kind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearKind() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get age => $_getIZ(2);
  @$pb.TagNumber(3)
  set age($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => clearField(3);
}

enum SampleOutput_OneofInput {
  name, 
  age, 
  notSet
}

/// [RUST-SIGNAL]
class SampleOutput extends $pb.GeneratedMessage {static final rustSignalStream =
    sampleOutputController.stream.asBroadcastStream();

  factory SampleOutput({
    Kind? kind,
    $core.String? name,
    $core.int? age,
  }) {
    final $result = create();
    if (kind != null) {
      $result.kind = kind;
    }
    if (name != null) {
      $result.name = name;
    }
    if (age != null) {
      $result.age = age;
    }
    return $result;
  }
  SampleOutput._() : super();
  factory SampleOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SampleOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SampleOutput_OneofInput> _SampleOutput_OneofInputByTag = {
    2 : SampleOutput_OneofInput.name,
    3 : SampleOutput_OneofInput.age,
    0 : SampleOutput_OneofInput.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SampleOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'sample_file'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..e<Kind>(1, _omitFieldNames ? '' : 'kind', $pb.PbFieldType.OE, defaultOrMaker: Kind.one, valueOf: Kind.valueOf, enumValues: Kind.values)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'age', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SampleOutput clone() => SampleOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SampleOutput copyWith(void Function(SampleOutput) updates) => super.copyWith((message) => updates(message as SampleOutput)) as SampleOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SampleOutput create() => SampleOutput._();
  SampleOutput createEmptyInstance() => create();
  static $pb.PbList<SampleOutput> createRepeated() => $pb.PbList<SampleOutput>();
  @$core.pragma('dart2js:noInline')
  static SampleOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SampleOutput>(create);
  static SampleOutput? _defaultInstance;

  SampleOutput_OneofInput whichOneofInput() => _SampleOutput_OneofInputByTag[$_whichOneof(0)]!;
  void clearOneofInput() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Kind get kind => $_getN(0);
  @$pb.TagNumber(1)
  set kind(Kind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearKind() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get age => $_getIZ(2);
  @$pb.TagNumber(3)
  set age($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearAge() => clearField(3);
}

/// [RUST-ATTRIBUTE(#[derive(Hash)])]
class WithRustAttribute extends $pb.GeneratedMessage {
  factory WithRustAttribute({
    $core.bool? dummy,
  }) {
    final $result = create();
    if (dummy != null) {
      $result.dummy = dummy;
    }
    return $result;
  }
  WithRustAttribute._() : super();
  factory WithRustAttribute.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WithRustAttribute.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WithRustAttribute', package: const $pb.PackageName(_omitMessageNames ? '' : 'sample_file'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'dummy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WithRustAttribute clone() => WithRustAttribute()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WithRustAttribute copyWith(void Function(WithRustAttribute) updates) => super.copyWith((message) => updates(message as WithRustAttribute)) as WithRustAttribute;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WithRustAttribute create() => WithRustAttribute._();
  WithRustAttribute createEmptyInstance() => create();
  static $pb.PbList<WithRustAttribute> createRepeated() => $pb.PbList<WithRustAttribute>();
  @$core.pragma('dart2js:noInline')
  static WithRustAttribute getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WithRustAttribute>(create);
  static WithRustAttribute? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get dummy => $_getBF(0);
  @$pb.TagNumber(1)
  set dummy($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDummy() => $_has(0);
  @$pb.TagNumber(1)
  void clearDummy() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

extension SampleInputExt on SampleInput{
  void sendSignalToRust() {
    sendDartSignal(
      1,
      this.writeToBuffer(),
      Uint8List(0),
    );
  }
}

final sampleOutputController = StreamController<RustSignal<SampleOutput>>();
