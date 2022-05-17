///
//  Generated code. Do not modify.
//  source: cosmosnodeclient/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use msgCreatePostDescriptor instead')
const MsgCreatePost$json = const {
  '1': 'MsgCreatePost',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `MsgCreatePost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreatePostDescriptor = $convert.base64Decode('Cg1Nc2dDcmVhdGVQb3N0EhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISFAoFdGl0bGUYAiABKAlSBXRpdGxlEhIKBGJvZHkYAyABKAlSBGJvZHk=');
@$core.Deprecated('Use msgCreatePostResponseDescriptor instead')
const MsgCreatePostResponse$json = const {
  '1': 'MsgCreatePostResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `MsgCreatePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreatePostResponseDescriptor = $convert.base64Decode('ChVNc2dDcmVhdGVQb3N0UmVzcG9uc2USDgoCaWQYASABKARSAmlk');
@$core.Deprecated('Use msgUpdatePostDescriptor instead')
const MsgUpdatePost$json = const {
  '1': 'MsgUpdatePost',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'id', '3': 2, '4': 1, '5': 4, '10': 'id'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'body', '3': 4, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `MsgUpdatePost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdatePostDescriptor = $convert.base64Decode('Cg1Nc2dVcGRhdGVQb3N0EhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISDgoCaWQYAiABKARSAmlkEhQKBXRpdGxlGAMgASgJUgV0aXRsZRISCgRib2R5GAQgASgJUgRib2R5');
@$core.Deprecated('Use msgUpdatePostResponseDescriptor instead')
const MsgUpdatePostResponse$json = const {
  '1': 'MsgUpdatePostResponse',
};

/// Descriptor for `MsgUpdatePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgUpdatePostResponseDescriptor = $convert.base64Decode('ChVNc2dVcGRhdGVQb3N0UmVzcG9uc2U=');
@$core.Deprecated('Use msgDeletePostDescriptor instead')
const MsgDeletePost$json = const {
  '1': 'MsgDeletePost',
  '2': const [
    const {'1': 'creator', '3': 1, '4': 1, '5': 9, '10': 'creator'},
    const {'1': 'id', '3': 2, '4': 1, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `MsgDeletePost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgDeletePostDescriptor = $convert.base64Decode('Cg1Nc2dEZWxldGVQb3N0EhgKB2NyZWF0b3IYASABKAlSB2NyZWF0b3ISDgoCaWQYAiABKARSAmlk');
@$core.Deprecated('Use msgDeletePostResponseDescriptor instead')
const MsgDeletePostResponse$json = const {
  '1': 'MsgDeletePostResponse',
};

/// Descriptor for `MsgDeletePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgDeletePostResponseDescriptor = $convert.base64Decode('ChVNc2dEZWxldGVQb3N0UmVzcG9uc2U=');
