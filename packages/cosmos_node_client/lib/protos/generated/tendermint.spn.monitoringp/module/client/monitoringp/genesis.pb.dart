///
//  Generated code. Do not modify.
//  source: monitoringp/genesis.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'consumer_client_id.pb.dart' as $3;
import 'connection_channel_id.pb.dart' as $4;
import 'monitoring_info.pb.dart' as $5;
import 'params.pb.dart' as $6;

class GenesisState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GenesisState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'portId')
    ..aOM<$3.ConsumerClientID>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consumerClientID', protoName: 'consumerClientID', subBuilder: $3.ConsumerClientID.create)
    ..aOM<$4.ConnectionChannelID>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionChannelID', protoName: 'connectionChannelID', subBuilder: $4.ConnectionChannelID.create)
    ..aOM<$5.MonitoringInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'monitoringInfo', protoName: 'monitoringInfo', subBuilder: $5.MonitoringInfo.create)
    ..aOM<$6.Params>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'params', subBuilder: $6.Params.create)
    ..hasRequiredFields = false
  ;

  GenesisState._() : super();
  factory GenesisState({
    $core.String? portId,
    $3.ConsumerClientID? consumerClientID,
    $4.ConnectionChannelID? connectionChannelID,
    $5.MonitoringInfo? monitoringInfo,
    $6.Params? params,
  }) {
    final _result = create();
    if (portId != null) {
      _result.portId = portId;
    }
    if (consumerClientID != null) {
      _result.consumerClientID = consumerClientID;
    }
    if (connectionChannelID != null) {
      _result.connectionChannelID = connectionChannelID;
    }
    if (monitoringInfo != null) {
      _result.monitoringInfo = monitoringInfo;
    }
    if (params != null) {
      _result.params = params;
    }
    return _result;
  }
  factory GenesisState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenesisState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenesisState clone() => GenesisState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenesisState copyWith(void Function(GenesisState) updates) => super.copyWith((message) => updates(message as GenesisState)) as GenesisState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenesisState create() => GenesisState._();
  GenesisState createEmptyInstance() => create();
  static $pb.PbList<GenesisState> createRepeated() => $pb.PbList<GenesisState>();
  @$core.pragma('dart2js:noInline')
  static GenesisState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenesisState>(create);
  static GenesisState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get portId => $_getSZ(0);
  @$pb.TagNumber(1)
  set portId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPortId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortId() => clearField(1);

  @$pb.TagNumber(2)
  $3.ConsumerClientID get consumerClientID => $_getN(1);
  @$pb.TagNumber(2)
  set consumerClientID($3.ConsumerClientID v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConsumerClientID() => $_has(1);
  @$pb.TagNumber(2)
  void clearConsumerClientID() => clearField(2);
  @$pb.TagNumber(2)
  $3.ConsumerClientID ensureConsumerClientID() => $_ensure(1);

  @$pb.TagNumber(3)
  $4.ConnectionChannelID get connectionChannelID => $_getN(2);
  @$pb.TagNumber(3)
  set connectionChannelID($4.ConnectionChannelID v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasConnectionChannelID() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectionChannelID() => clearField(3);
  @$pb.TagNumber(3)
  $4.ConnectionChannelID ensureConnectionChannelID() => $_ensure(2);

  @$pb.TagNumber(4)
  $5.MonitoringInfo get monitoringInfo => $_getN(3);
  @$pb.TagNumber(4)
  set monitoringInfo($5.MonitoringInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMonitoringInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMonitoringInfo() => clearField(4);
  @$pb.TagNumber(4)
  $5.MonitoringInfo ensureMonitoringInfo() => $_ensure(3);

  @$pb.TagNumber(5)
  $6.Params get params => $_getN(4);
  @$pb.TagNumber(5)
  set params($6.Params v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasParams() => $_has(4);
  @$pb.TagNumber(5)
  void clearParams() => clearField(5);
  @$pb.TagNumber(5)
  $6.Params ensureParams() => $_ensure(4);
}

