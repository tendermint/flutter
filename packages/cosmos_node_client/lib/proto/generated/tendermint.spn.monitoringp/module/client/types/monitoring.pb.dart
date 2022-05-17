///
//  Generated code. Do not modify.
//  source: types/monitoring.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

enum MonitoringPacketData_Packet {
  monitoringPacket, 
  notSet
}

class MonitoringPacketData extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, MonitoringPacketData_Packet> _MonitoringPacketData_PacketByTag = {
    1 : MonitoringPacketData_Packet.monitoringPacket,
    0 : MonitoringPacketData_Packet.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MonitoringPacketData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..oo(0, [1])
    ..aOM<MonitoringPacket>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'monitoringPacket', protoName: 'monitoringPacket', subBuilder: MonitoringPacket.create)
    ..hasRequiredFields = false
  ;

  MonitoringPacketData._() : super();
  factory MonitoringPacketData({
    MonitoringPacket? monitoringPacket,
  }) {
    final _result = create();
    if (monitoringPacket != null) {
      _result.monitoringPacket = monitoringPacket;
    }
    return _result;
  }
  factory MonitoringPacketData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonitoringPacketData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonitoringPacketData clone() => MonitoringPacketData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonitoringPacketData copyWith(void Function(MonitoringPacketData) updates) => super.copyWith((message) => updates(message as MonitoringPacketData)) as MonitoringPacketData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MonitoringPacketData create() => MonitoringPacketData._();
  MonitoringPacketData createEmptyInstance() => create();
  static $pb.PbList<MonitoringPacketData> createRepeated() => $pb.PbList<MonitoringPacketData>();
  @$core.pragma('dart2js:noInline')
  static MonitoringPacketData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonitoringPacketData>(create);
  static MonitoringPacketData? _defaultInstance;

  MonitoringPacketData_Packet whichPacket() => _MonitoringPacketData_PacketByTag[$_whichOneof(0)]!;
  void clearPacket() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MonitoringPacket get monitoringPacket => $_getN(0);
  @$pb.TagNumber(1)
  set monitoringPacket(MonitoringPacket v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMonitoringPacket() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonitoringPacket() => clearField(1);
  @$pb.TagNumber(1)
  MonitoringPacket ensureMonitoringPacket() => $_ensure(0);
}

class MonitoringPacketAck extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MonitoringPacketAck', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MonitoringPacketAck._() : super();
  factory MonitoringPacketAck() => create();
  factory MonitoringPacketAck.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonitoringPacketAck.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonitoringPacketAck clone() => MonitoringPacketAck()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonitoringPacketAck copyWith(void Function(MonitoringPacketAck) updates) => super.copyWith((message) => updates(message as MonitoringPacketAck)) as MonitoringPacketAck; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MonitoringPacketAck create() => MonitoringPacketAck._();
  MonitoringPacketAck createEmptyInstance() => create();
  static $pb.PbList<MonitoringPacketAck> createRepeated() => $pb.PbList<MonitoringPacketAck>();
  @$core.pragma('dart2js:noInline')
  static MonitoringPacketAck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonitoringPacketAck>(create);
  static MonitoringPacketAck? _defaultInstance;
}

class MonitoringPacket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MonitoringPacket', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blockHeight', protoName: 'blockHeight')
    ..aOM<SignatureCounts>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signatureCounts', protoName: 'signatureCounts', subBuilder: SignatureCounts.create)
    ..hasRequiredFields = false
  ;

  MonitoringPacket._() : super();
  factory MonitoringPacket({
    $fixnum.Int64? blockHeight,
    SignatureCounts? signatureCounts,
  }) {
    final _result = create();
    if (blockHeight != null) {
      _result.blockHeight = blockHeight;
    }
    if (signatureCounts != null) {
      _result.signatureCounts = signatureCounts;
    }
    return _result;
  }
  factory MonitoringPacket.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonitoringPacket.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonitoringPacket clone() => MonitoringPacket()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonitoringPacket copyWith(void Function(MonitoringPacket) updates) => super.copyWith((message) => updates(message as MonitoringPacket)) as MonitoringPacket; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MonitoringPacket create() => MonitoringPacket._();
  MonitoringPacket createEmptyInstance() => create();
  static $pb.PbList<MonitoringPacket> createRepeated() => $pb.PbList<MonitoringPacket>();
  @$core.pragma('dart2js:noInline')
  static MonitoringPacket getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonitoringPacket>(create);
  static MonitoringPacket? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get blockHeight => $_getI64(0);
  @$pb.TagNumber(1)
  set blockHeight($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockHeight() => clearField(1);

  @$pb.TagNumber(2)
  SignatureCounts get signatureCounts => $_getN(1);
  @$pb.TagNumber(2)
  set signatureCounts(SignatureCounts v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignatureCounts() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignatureCounts() => clearField(2);
  @$pb.TagNumber(2)
  SignatureCounts ensureSignatureCounts() => $_ensure(1);
}

class SignatureCounts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignatureCounts', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blockCount', $pb.PbFieldType.OU6, protoName: 'blockCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<SignatureCount>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'counts', $pb.PbFieldType.PM, subBuilder: SignatureCount.create)
    ..hasRequiredFields = false
  ;

  SignatureCounts._() : super();
  factory SignatureCounts({
    $fixnum.Int64? blockCount,
    $core.Iterable<SignatureCount>? counts,
  }) {
    final _result = create();
    if (blockCount != null) {
      _result.blockCount = blockCount;
    }
    if (counts != null) {
      _result.counts.addAll(counts);
    }
    return _result;
  }
  factory SignatureCounts.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignatureCounts.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignatureCounts clone() => SignatureCounts()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignatureCounts copyWith(void Function(SignatureCounts) updates) => super.copyWith((message) => updates(message as SignatureCounts)) as SignatureCounts; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignatureCounts create() => SignatureCounts._();
  SignatureCounts createEmptyInstance() => create();
  static $pb.PbList<SignatureCounts> createRepeated() => $pb.PbList<SignatureCounts>();
  @$core.pragma('dart2js:noInline')
  static SignatureCounts getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignatureCounts>(create);
  static SignatureCounts? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get blockCount => $_getI64(0);
  @$pb.TagNumber(1)
  set blockCount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<SignatureCount> get counts => $_getList(1);
}

class SignatureCount extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignatureCount', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'opAddress', protoName: 'opAddress')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'RelativeSignatures', protoName: 'RelativeSignatures')
    ..hasRequiredFields = false
  ;

  SignatureCount._() : super();
  factory SignatureCount({
    $core.String? opAddress,
    $core.String? relativeSignatures,
  }) {
    final _result = create();
    if (opAddress != null) {
      _result.opAddress = opAddress;
    }
    if (relativeSignatures != null) {
      _result.relativeSignatures = relativeSignatures;
    }
    return _result;
  }
  factory SignatureCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignatureCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignatureCount clone() => SignatureCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignatureCount copyWith(void Function(SignatureCount) updates) => super.copyWith((message) => updates(message as SignatureCount)) as SignatureCount; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignatureCount create() => SignatureCount._();
  SignatureCount createEmptyInstance() => create();
  static $pb.PbList<SignatureCount> createRepeated() => $pb.PbList<SignatureCount>();
  @$core.pragma('dart2js:noInline')
  static SignatureCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignatureCount>(create);
  static SignatureCount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get opAddress => $_getSZ(0);
  @$pb.TagNumber(1)
  set opAddress($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOpAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearOpAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get relativeSignatures => $_getSZ(1);
  @$pb.TagNumber(2)
  set relativeSignatures($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRelativeSignatures() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelativeSignatures() => clearField(2);
}

