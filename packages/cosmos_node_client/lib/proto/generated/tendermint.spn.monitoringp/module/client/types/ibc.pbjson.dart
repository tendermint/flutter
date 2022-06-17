///
//  Generated code. Do not modify.
//  source: types/ibc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use merkleRootDescriptor instead')
const MerkleRoot$json = const {
  '1': 'MerkleRoot',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 9, '10': 'hash'},
  ],
};

/// Descriptor for `MerkleRoot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List merkleRootDescriptor = $convert.base64Decode('CgpNZXJrbGVSb290EhIKBGhhc2gYASABKAlSBGhhc2g=');
@$core.Deprecated('Use consensusStateDescriptor instead')
const ConsensusState$json = const {
  '1': 'ConsensusState',
  '2': const [
    const {'1': 'nextValidatorsHash', '3': 1, '4': 1, '5': 9, '10': 'nextValidatorsHash'},
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 9, '10': 'timestamp'},
    const {'1': 'root', '3': 3, '4': 1, '5': 11, '6': '.tendermint.spn.types.MerkleRoot', '8': const {}, '10': 'root'},
  ],
};

/// Descriptor for `ConsensusState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List consensusStateDescriptor = $convert.base64Decode('Cg5Db25zZW5zdXNTdGF0ZRIuChJuZXh0VmFsaWRhdG9yc0hhc2gYASABKAlSEm5leHRWYWxpZGF0b3JzSGFzaBIcCgl0aW1lc3RhbXAYAiABKAlSCXRpbWVzdGFtcBI6CgRyb290GAMgASgLMiAudGVuZGVybWludC5zcG4udHlwZXMuTWVya2xlUm9vdEIEyN4fAFIEcm9vdA==');
@$core.Deprecated('Use pubKeyDescriptor instead')
const PubKey$json = const {
  '1': 'PubKey',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `PubKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pubKeyDescriptor = $convert.base64Decode('CgZQdWJLZXkSEgoEdHlwZRgBIAEoCVIEdHlwZRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU=');
@$core.Deprecated('Use validatorDescriptor instead')
const Validator$json = const {
  '1': 'Validator',
  '2': const [
    const {'1': 'proposerPriority', '3': 1, '4': 1, '5': 9, '10': 'proposerPriority'},
    const {'1': 'votingPower', '3': 2, '4': 1, '5': 9, '10': 'votingPower'},
    const {'1': 'pubKey', '3': 3, '4': 1, '5': 11, '6': '.tendermint.spn.types.PubKey', '8': const {}, '10': 'pubKey'},
  ],
};

/// Descriptor for `Validator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorDescriptor = $convert.base64Decode('CglWYWxpZGF0b3ISKgoQcHJvcG9zZXJQcmlvcml0eRgBIAEoCVIQcHJvcG9zZXJQcmlvcml0eRIgCgt2b3RpbmdQb3dlchgCIAEoCVILdm90aW5nUG93ZXISOgoGcHViS2V5GAMgASgLMhwudGVuZGVybWludC5zcG4udHlwZXMuUHViS2V5QgTI3h8AUgZwdWJLZXk=');
@$core.Deprecated('Use validatorSetDescriptor instead')
const ValidatorSet$json = const {
  '1': 'ValidatorSet',
  '2': const [
    const {'1': 'validators', '3': 1, '4': 3, '5': 11, '6': '.tendermint.spn.types.Validator', '8': const {}, '10': 'validators'},
  ],
};

/// Descriptor for `ValidatorSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorSetDescriptor = $convert.base64Decode('CgxWYWxpZGF0b3JTZXQSRQoKdmFsaWRhdG9ycxgBIAMoCzIfLnRlbmRlcm1pbnQuc3BuLnR5cGVzLlZhbGlkYXRvckIEyN4fAFIKdmFsaWRhdG9ycw==');
