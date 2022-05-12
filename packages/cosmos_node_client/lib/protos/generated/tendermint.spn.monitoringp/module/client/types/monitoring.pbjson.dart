///
//  Generated code. Do not modify.
//  source: types/monitoring.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use monitoringPacketDataDescriptor instead')
const MonitoringPacketData$json = const {
  '1': 'MonitoringPacketData',
  '2': const [
    const {'1': 'monitoringPacket', '3': 1, '4': 1, '5': 11, '6': '.tendermint.spn.types.MonitoringPacket', '9': 0, '10': 'monitoringPacket'},
  ],
  '8': const [
    const {'1': 'packet'},
  ],
};

/// Descriptor for `MonitoringPacketData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monitoringPacketDataDescriptor = $convert.base64Decode('ChRNb25pdG9yaW5nUGFja2V0RGF0YRJUChBtb25pdG9yaW5nUGFja2V0GAEgASgLMiYudGVuZGVybWludC5zcG4udHlwZXMuTW9uaXRvcmluZ1BhY2tldEgAUhBtb25pdG9yaW5nUGFja2V0QggKBnBhY2tldA==');
@$core.Deprecated('Use monitoringPacketAckDescriptor instead')
const MonitoringPacketAck$json = const {
  '1': 'MonitoringPacketAck',
};

/// Descriptor for `MonitoringPacketAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monitoringPacketAckDescriptor = $convert.base64Decode('ChNNb25pdG9yaW5nUGFja2V0QWNr');
@$core.Deprecated('Use monitoringPacketDescriptor instead')
const MonitoringPacket$json = const {
  '1': 'MonitoringPacket',
  '2': const [
    const {'1': 'blockHeight', '3': 1, '4': 1, '5': 3, '10': 'blockHeight'},
    const {'1': 'signatureCounts', '3': 2, '4': 1, '5': 11, '6': '.tendermint.spn.types.SignatureCounts', '8': const {}, '10': 'signatureCounts'},
  ],
};

/// Descriptor for `MonitoringPacket`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monitoringPacketDescriptor = $convert.base64Decode('ChBNb25pdG9yaW5nUGFja2V0EiAKC2Jsb2NrSGVpZ2h0GAEgASgDUgtibG9ja0hlaWdodBJVCg9zaWduYXR1cmVDb3VudHMYAiABKAsyJS50ZW5kZXJtaW50LnNwbi50eXBlcy5TaWduYXR1cmVDb3VudHNCBMjeHwBSD3NpZ25hdHVyZUNvdW50cw==');
@$core.Deprecated('Use signatureCountsDescriptor instead')
const SignatureCounts$json = const {
  '1': 'SignatureCounts',
  '2': const [
    const {'1': 'blockCount', '3': 1, '4': 1, '5': 4, '10': 'blockCount'},
    const {'1': 'counts', '3': 2, '4': 3, '5': 11, '6': '.tendermint.spn.types.SignatureCount', '8': const {}, '10': 'counts'},
  ],
};

/// Descriptor for `SignatureCounts`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signatureCountsDescriptor = $convert.base64Decode('Cg9TaWduYXR1cmVDb3VudHMSHgoKYmxvY2tDb3VudBgBIAEoBFIKYmxvY2tDb3VudBJCCgZjb3VudHMYAiADKAsyJC50ZW5kZXJtaW50LnNwbi50eXBlcy5TaWduYXR1cmVDb3VudEIEyN4fAFIGY291bnRz');
@$core.Deprecated('Use signatureCountDescriptor instead')
const SignatureCount$json = const {
  '1': 'SignatureCount',
  '2': const [
    const {'1': 'opAddress', '3': 1, '4': 1, '5': 9, '10': 'opAddress'},
    const {'1': 'RelativeSignatures', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'RelativeSignatures'},
  ],
};

/// Descriptor for `SignatureCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signatureCountDescriptor = $convert.base64Decode('Cg5TaWduYXR1cmVDb3VudBIcCglvcEFkZHJlc3MYASABKAlSCW9wQWRkcmVzcxJeChJSZWxhdGl2ZVNpZ25hdHVyZXMYAiABKAlCLsjeHwDa3h8mZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5EZWNSElJlbGF0aXZlU2lnbmF0dXJlcw==');
