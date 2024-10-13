//
//  Generated code. Do not modify.
//  source: proof_generation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use proofGenerationInputDescriptor instead')
const ProofGenerationInput$json = {
  '1': 'ProofGenerationInput',
  '2': [
    {'1': 'a', '3': 1, '4': 1, '5': 4, '10': 'a'},
    {'1': 'b', '3': 2, '4': 1, '5': 4, '10': 'b'},
  ],
};

/// Descriptor for `ProofGenerationInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proofGenerationInputDescriptor = $convert.base64Decode(
    'ChRQcm9vZkdlbmVyYXRpb25JbnB1dBIMCgFhGAEgASgEUgFhEgwKAWIYAiABKARSAWI=');

@$core.Deprecated('Use proofGenerationOutputDescriptor instead')
const ProofGenerationOutput$json = {
  '1': 'ProofGenerationOutput',
  '2': [
    {'1': 'vk_bytes', '3': 1, '4': 1, '5': 12, '10': 'vkBytes'},
    {'1': 'proof_bytes', '3': 2, '4': 1, '5': 12, '10': 'proofBytes'},
    {'1': 'public_inputs_bytes', '3': 3, '4': 1, '5': 12, '10': 'publicInputsBytes'},
  ],
};

/// Descriptor for `ProofGenerationOutput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proofGenerationOutputDescriptor = $convert.base64Decode(
    'ChVQcm9vZkdlbmVyYXRpb25PdXRwdXQSGQoIdmtfYnl0ZXMYASABKAxSB3ZrQnl0ZXMSHwoLcH'
    'Jvb2ZfYnl0ZXMYAiABKAxSCnByb29mQnl0ZXMSLgoTcHVibGljX2lucHV0c19ieXRlcxgDIAEo'
    'DFIRcHVibGljSW5wdXRzQnl0ZXM=');

