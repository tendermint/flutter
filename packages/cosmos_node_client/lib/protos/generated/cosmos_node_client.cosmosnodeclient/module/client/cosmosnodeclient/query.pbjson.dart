///
//  Generated code. Do not modify.
//  source: cosmosnodeclient/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryParamsRequestDescriptor instead')
const QueryParamsRequest$json = const {
  '1': 'QueryParamsRequest',
};

/// Descriptor for `QueryParamsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsRequestDescriptor = $convert.base64Decode('ChJRdWVyeVBhcmFtc1JlcXVlc3Q=');
@$core.Deprecated('Use queryParamsResponseDescriptor instead')
const QueryParamsResponse$json = const {
  '1': 'QueryParamsResponse',
  '2': const [
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.cosmos_node_client.cosmosnodeclient.Params', '8': const {}, '10': 'params'},
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode('ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEkkKBnBhcmFtcxgBIAEoCzIrLmNvc21vc19ub2RlX2NsaWVudC5jb3Ntb3Nub2RlY2xpZW50LlBhcmFtc0IEyN4fAFIGcGFyYW1z');
@$core.Deprecated('Use queryGetPostRequestDescriptor instead')
const QueryGetPostRequest$json = const {
  '1': 'QueryGetPostRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 4, '10': 'id'},
  ],
};

/// Descriptor for `QueryGetPostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetPostRequestDescriptor = $convert.base64Decode('ChNRdWVyeUdldFBvc3RSZXF1ZXN0Eg4KAmlkGAEgASgEUgJpZA==');
@$core.Deprecated('Use queryGetPostResponseDescriptor instead')
const QueryGetPostResponse$json = const {
  '1': 'QueryGetPostResponse',
  '2': const [
    const {'1': 'Post', '3': 1, '4': 1, '5': 11, '6': '.cosmos_node_client.cosmosnodeclient.Post', '8': const {}, '10': 'Post'},
  ],
};

/// Descriptor for `QueryGetPostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryGetPostResponseDescriptor = $convert.base64Decode('ChRRdWVyeUdldFBvc3RSZXNwb25zZRJDCgRQb3N0GAEgASgLMikuY29zbW9zX25vZGVfY2xpZW50LmNvc21vc25vZGVjbGllbnQuUG9zdEIEyN4fAFIEUG9zdA==');
@$core.Deprecated('Use queryAllPostRequestDescriptor instead')
const QueryAllPostRequest$json = const {
  '1': 'QueryAllPostRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryAllPostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllPostRequestDescriptor = $convert.base64Decode('ChNRdWVyeUFsbFBvc3RSZXF1ZXN0EkYKCnBhZ2luYXRpb24YASABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryAllPostResponseDescriptor instead')
const QueryAllPostResponse$json = const {
  '1': 'QueryAllPostResponse',
  '2': const [
    const {'1': 'Post', '3': 1, '4': 3, '5': 11, '6': '.cosmos_node_client.cosmosnodeclient.Post', '8': const {}, '10': 'Post'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryAllPostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllPostResponseDescriptor = $convert.base64Decode('ChRRdWVyeUFsbFBvc3RSZXNwb25zZRJDCgRQb3N0GAEgAygLMikuY29zbW9zX25vZGVfY2xpZW50LmNvc21vc25vZGVjbGllbnQuUG9zdEIEyN4fAFIEUG9zdBJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
