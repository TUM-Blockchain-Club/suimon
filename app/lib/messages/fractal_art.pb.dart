// ignore_for_file: invalid_language_version_override

import 'dart:async';
import 'dart:typed_data';
import 'package:rinf/rinf.dart';

//
//  Generated code. Do not modify.
//  source: fractal_art.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'counter_number.pb.dart' as $0;

/// [RUST-SIGNAL-BINARY]
/// You can add your custom comments like this.
/// Protobuf's import statement also works well.
class SampleFractal extends $pb.GeneratedMessage {static final rustSignalStream =
    sampleFractalController.stream.asBroadcastStream();

  factory SampleFractal({
    $core.double? currentScale,
    $0.SampleSchema? dummy,
  }) {
    final $result = create();
    if (currentScale != null) {
      $result.currentScale = currentScale;
    }
    if (dummy != null) {
      $result.dummy = dummy;
    }
    return $result;
  }
  SampleFractal._() : super();
  factory SampleFractal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SampleFractal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SampleFractal', package: const $pb.PackageName(_omitMessageNames ? '' : 'fractal_art'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'currentScale', $pb.PbFieldType.OD)
    ..aOM<$0.SampleSchema>(2, _omitFieldNames ? '' : 'dummy', subBuilder: $0.SampleSchema.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SampleFractal clone() => SampleFractal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SampleFractal copyWith(void Function(SampleFractal) updates) => super.copyWith((message) => updates(message as SampleFractal)) as SampleFractal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SampleFractal create() => SampleFractal._();
  SampleFractal createEmptyInstance() => create();
  static $pb.PbList<SampleFractal> createRepeated() => $pb.PbList<SampleFractal>();
  @$core.pragma('dart2js:noInline')
  static SampleFractal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SampleFractal>(create);
  static SampleFractal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get currentScale => $_getN(0);
  @$pb.TagNumber(1)
  set currentScale($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrentScale() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentScale() => clearField(1);

  @$pb.TagNumber(2)
  $0.SampleSchema get dummy => $_getN(1);
  @$pb.TagNumber(2)
  set dummy($0.SampleSchema v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDummy() => $_has(1);
  @$pb.TagNumber(2)
  void clearDummy() => clearField(2);
  @$pb.TagNumber(2)
  $0.SampleSchema ensureDummy() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

final sampleFractalController = StreamController<RustSignal<SampleFractal>>();
