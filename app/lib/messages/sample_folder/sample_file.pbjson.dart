//
//  Generated code. Do not modify.
//  source: sample_file.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use kindDescriptor instead')
const Kind$json = {
  '1': 'Kind',
  '2': [
    {'1': 'one', '2': 0},
    {'1': 'two', '2': 1},
  ],
};

/// Descriptor for `Kind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List kindDescriptor = $convert.base64Decode(
    'CgRLaW5kEgcKA29uZRAAEgcKA3R3bxAB');

@$core.Deprecated('Use sampleInputDescriptor instead')
const SampleInput$json = {
  '1': 'SampleInput',
  '2': [
    {'1': 'kind', '3': 1, '4': 1, '5': 14, '6': '.sample_file.Kind', '10': 'kind'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name'},
    {'1': 'age', '3': 3, '4': 1, '5': 5, '9': 0, '10': 'age'},
  ],
  '8': [
    {'1': 'oneof_input'},
  ],
};

/// Descriptor for `SampleInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sampleInputDescriptor = $convert.base64Decode(
    'CgtTYW1wbGVJbnB1dBIlCgRraW5kGAEgASgOMhEuc2FtcGxlX2ZpbGUuS2luZFIEa2luZBIUCg'
    'RuYW1lGAIgASgJSABSBG5hbWUSEgoDYWdlGAMgASgFSABSA2FnZUINCgtvbmVvZl9pbnB1dA==');

@$core.Deprecated('Use sampleOutputDescriptor instead')
const SampleOutput$json = {
  '1': 'SampleOutput',
  '2': [
    {'1': 'kind', '3': 1, '4': 1, '5': 14, '6': '.sample_file.Kind', '10': 'kind'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name'},
    {'1': 'age', '3': 3, '4': 1, '5': 5, '9': 0, '10': 'age'},
  ],
  '8': [
    {'1': 'oneof_input'},
  ],
};

/// Descriptor for `SampleOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sampleOutputDescriptor = $convert.base64Decode(
    'CgxTYW1wbGVPdXRwdXQSJQoEa2luZBgBIAEoDjIRLnNhbXBsZV9maWxlLktpbmRSBGtpbmQSFA'
    'oEbmFtZRgCIAEoCUgAUgRuYW1lEhIKA2FnZRgDIAEoBUgAUgNhZ2VCDQoLb25lb2ZfaW5wdXQ=');

@$core.Deprecated('Use withRustAttributeDescriptor instead')
const WithRustAttribute$json = {
  '1': 'WithRustAttribute',
  '2': [
    {'1': 'dummy', '3': 1, '4': 1, '5': 8, '10': 'dummy'},
  ],
};

/// Descriptor for `WithRustAttribute`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List withRustAttributeDescriptor = $convert.base64Decode(
    'ChFXaXRoUnVzdEF0dHJpYnV0ZRIUCgVkdW1teRgBIAEoCFIFZHVtbXk=');

