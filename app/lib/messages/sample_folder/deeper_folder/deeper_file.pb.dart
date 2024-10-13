//
//  Generated code. Do not modify.
//  source: deeper_file.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DeeperDummy extends $pb.GeneratedMessage {
  factory DeeperDummy() => create();
  DeeperDummy._() : super();
  factory DeeperDummy.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeeperDummy.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeeperDummy', package: const $pb.PackageName(_omitMessageNames ? '' : 'deeper_file'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeeperDummy clone() => DeeperDummy()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeeperDummy copyWith(void Function(DeeperDummy) updates) => super.copyWith((message) => updates(message as DeeperDummy)) as DeeperDummy;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeeperDummy create() => DeeperDummy._();
  DeeperDummy createEmptyInstance() => create();
  static $pb.PbList<DeeperDummy> createRepeated() => $pb.PbList<DeeperDummy>();
  @$core.pragma('dart2js:noInline')
  static DeeperDummy getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeeperDummy>(create);
  static DeeperDummy? _defaultInstance;
}


const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
