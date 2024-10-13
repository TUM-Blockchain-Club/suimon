// ignore_for_file: invalid_language_version_override

import 'dart:async';
import 'dart:typed_data';
import 'package:rinf/rinf.dart';

//
//  Generated code. Do not modify.
//  source: proof_generation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

/// [DART-SIGNAL]
class ProofGenerationInput extends $pb.GeneratedMessage {
  factory ProofGenerationInput({
    $fixnum.Int64? a,
    $fixnum.Int64? b,
  }) {
    final $result = create();
    if (a != null) {
      $result.a = a;
    }
    if (b != null) {
      $result.b = b;
    }
    return $result;
  }
  ProofGenerationInput._() : super();
  factory ProofGenerationInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProofGenerationInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProofGenerationInput', package: const $pb.PackageName(_omitMessageNames ? '' : 'proof_generation'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'a', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'b', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProofGenerationInput clone() => ProofGenerationInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProofGenerationInput copyWith(void Function(ProofGenerationInput) updates) => super.copyWith((message) => updates(message as ProofGenerationInput)) as ProofGenerationInput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProofGenerationInput create() => ProofGenerationInput._();
  ProofGenerationInput createEmptyInstance() => create();
  static $pb.PbList<ProofGenerationInput> createRepeated() => $pb.PbList<ProofGenerationInput>();
  @$core.pragma('dart2js:noInline')
  static ProofGenerationInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProofGenerationInput>(create);
  static ProofGenerationInput? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get a => $_getI64(0);
  @$pb.TagNumber(1)
  set a($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasA() => $_has(0);
  @$pb.TagNumber(1)
  void clearA() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get b => $_getI64(1);
  @$pb.TagNumber(2)
  set b($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasB() => $_has(1);
  @$pb.TagNumber(2)
  void clearB() => clearField(2);
}

/// [RUST-SIGNAL]
class ProofGenerationOutput extends $pb.GeneratedMessage {static final rustSignalStream =
    proofGenerationOutputController.stream.asBroadcastStream();

  factory ProofGenerationOutput({
    $core.List<$core.int>? vkBytes,
    $core.List<$core.int>? proofBytes,
    $core.List<$core.int>? publicInputsBytes,
  }) {
    final $result = create();
    if (vkBytes != null) {
      $result.vkBytes = vkBytes;
    }
    if (proofBytes != null) {
      $result.proofBytes = proofBytes;
    }
    if (publicInputsBytes != null) {
      $result.publicInputsBytes = publicInputsBytes;
    }
    return $result;
  }
  ProofGenerationOutput._() : super();
  factory ProofGenerationOutput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProofGenerationOutput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProofGenerationOutput', package: const $pb.PackageName(_omitMessageNames ? '' : 'proof_generation'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'vkBytes', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'proofBytes', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'publicInputsBytes', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProofGenerationOutput clone() => ProofGenerationOutput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProofGenerationOutput copyWith(void Function(ProofGenerationOutput) updates) => super.copyWith((message) => updates(message as ProofGenerationOutput)) as ProofGenerationOutput;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProofGenerationOutput create() => ProofGenerationOutput._();
  ProofGenerationOutput createEmptyInstance() => create();
  static $pb.PbList<ProofGenerationOutput> createRepeated() => $pb.PbList<ProofGenerationOutput>();
  @$core.pragma('dart2js:noInline')
  static ProofGenerationOutput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProofGenerationOutput>(create);
  static ProofGenerationOutput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get vkBytes => $_getN(0);
  @$pb.TagNumber(1)
  set vkBytes($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVkBytes() => $_has(0);
  @$pb.TagNumber(1)
  void clearVkBytes() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get proofBytes => $_getN(1);
  @$pb.TagNumber(2)
  set proofBytes($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProofBytes() => $_has(1);
  @$pb.TagNumber(2)
  void clearProofBytes() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get publicInputsBytes => $_getN(2);
  @$pb.TagNumber(3)
  set publicInputsBytes($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicInputsBytes() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicInputsBytes() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

extension ProofGenerationInputExt on ProofGenerationInput{
  void sendSignalToRust() {
    sendDartSignal(
      3,
      this.writeToBuffer(),
      Uint8List(0),
    );
  }
}

final proofGenerationOutputController = StreamController<RustSignal<ProofGenerationOutput>>();
