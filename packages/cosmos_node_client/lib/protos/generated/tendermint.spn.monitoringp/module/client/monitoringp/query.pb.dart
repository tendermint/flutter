///
//  Generated code. Do not modify.
//  source: monitoringp/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'consumer_client_id.pb.dart' as $3;
import 'connection_channel_id.pb.dart' as $4;
import 'monitoring_info.pb.dart' as $5;
import 'params.pb.dart' as $6;

class QueryGetConsumerClientIDRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetConsumerClientIDRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryGetConsumerClientIDRequest._() : super();
  factory QueryGetConsumerClientIDRequest() => create();
  factory QueryGetConsumerClientIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetConsumerClientIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetConsumerClientIDRequest clone() => QueryGetConsumerClientIDRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetConsumerClientIDRequest copyWith(void Function(QueryGetConsumerClientIDRequest) updates) => super.copyWith((message) => updates(message as QueryGetConsumerClientIDRequest)) as QueryGetConsumerClientIDRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetConsumerClientIDRequest create() => QueryGetConsumerClientIDRequest._();
  QueryGetConsumerClientIDRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetConsumerClientIDRequest> createRepeated() => $pb.PbList<QueryGetConsumerClientIDRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetConsumerClientIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetConsumerClientIDRequest>(create);
  static QueryGetConsumerClientIDRequest? _defaultInstance;
}

class QueryGetConsumerClientIDResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetConsumerClientIDResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..aOM<$3.ConsumerClientID>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ConsumerClientID', protoName: 'ConsumerClientID', subBuilder: $3.ConsumerClientID.create)
    ..hasRequiredFields = false
  ;

  QueryGetConsumerClientIDResponse._() : super();
  factory QueryGetConsumerClientIDResponse({
    $3.ConsumerClientID? consumerClientID,
  }) {
    final _result = create();
    if (consumerClientID != null) {
      _result.consumerClientID = consumerClientID;
    }
    return _result;
  }
  factory QueryGetConsumerClientIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetConsumerClientIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetConsumerClientIDResponse clone() => QueryGetConsumerClientIDResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetConsumerClientIDResponse copyWith(void Function(QueryGetConsumerClientIDResponse) updates) => super.copyWith((message) => updates(message as QueryGetConsumerClientIDResponse)) as QueryGetConsumerClientIDResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetConsumerClientIDResponse create() => QueryGetConsumerClientIDResponse._();
  QueryGetConsumerClientIDResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetConsumerClientIDResponse> createRepeated() => $pb.PbList<QueryGetConsumerClientIDResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetConsumerClientIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetConsumerClientIDResponse>(create);
  static QueryGetConsumerClientIDResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.ConsumerClientID get consumerClientID => $_getN(0);
  @$pb.TagNumber(1)
  set consumerClientID($3.ConsumerClientID v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConsumerClientID() => $_has(0);
  @$pb.TagNumber(1)
  void clearConsumerClientID() => clearField(1);
  @$pb.TagNumber(1)
  $3.ConsumerClientID ensureConsumerClientID() => $_ensure(0);
}

class QueryGetConnectionChannelIDRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetConnectionChannelIDRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryGetConnectionChannelIDRequest._() : super();
  factory QueryGetConnectionChannelIDRequest() => create();
  factory QueryGetConnectionChannelIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetConnectionChannelIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetConnectionChannelIDRequest clone() => QueryGetConnectionChannelIDRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetConnectionChannelIDRequest copyWith(void Function(QueryGetConnectionChannelIDRequest) updates) => super.copyWith((message) => updates(message as QueryGetConnectionChannelIDRequest)) as QueryGetConnectionChannelIDRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetConnectionChannelIDRequest create() => QueryGetConnectionChannelIDRequest._();
  QueryGetConnectionChannelIDRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetConnectionChannelIDRequest> createRepeated() => $pb.PbList<QueryGetConnectionChannelIDRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetConnectionChannelIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetConnectionChannelIDRequest>(create);
  static QueryGetConnectionChannelIDRequest? _defaultInstance;
}

class QueryGetConnectionChannelIDResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetConnectionChannelIDResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..aOM<$4.ConnectionChannelID>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ConnectionChannelID', protoName: 'ConnectionChannelID', subBuilder: $4.ConnectionChannelID.create)
    ..hasRequiredFields = false
  ;

  QueryGetConnectionChannelIDResponse._() : super();
  factory QueryGetConnectionChannelIDResponse({
    $4.ConnectionChannelID? connectionChannelID,
  }) {
    final _result = create();
    if (connectionChannelID != null) {
      _result.connectionChannelID = connectionChannelID;
    }
    return _result;
  }
  factory QueryGetConnectionChannelIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetConnectionChannelIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetConnectionChannelIDResponse clone() => QueryGetConnectionChannelIDResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetConnectionChannelIDResponse copyWith(void Function(QueryGetConnectionChannelIDResponse) updates) => super.copyWith((message) => updates(message as QueryGetConnectionChannelIDResponse)) as QueryGetConnectionChannelIDResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetConnectionChannelIDResponse create() => QueryGetConnectionChannelIDResponse._();
  QueryGetConnectionChannelIDResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetConnectionChannelIDResponse> createRepeated() => $pb.PbList<QueryGetConnectionChannelIDResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetConnectionChannelIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetConnectionChannelIDResponse>(create);
  static QueryGetConnectionChannelIDResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $4.ConnectionChannelID get connectionChannelID => $_getN(0);
  @$pb.TagNumber(1)
  set connectionChannelID($4.ConnectionChannelID v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnectionChannelID() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnectionChannelID() => clearField(1);
  @$pb.TagNumber(1)
  $4.ConnectionChannelID ensureConnectionChannelID() => $_ensure(0);
}

class QueryGetMonitoringInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetMonitoringInfoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryGetMonitoringInfoRequest._() : super();
  factory QueryGetMonitoringInfoRequest() => create();
  factory QueryGetMonitoringInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetMonitoringInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetMonitoringInfoRequest clone() => QueryGetMonitoringInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetMonitoringInfoRequest copyWith(void Function(QueryGetMonitoringInfoRequest) updates) => super.copyWith((message) => updates(message as QueryGetMonitoringInfoRequest)) as QueryGetMonitoringInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetMonitoringInfoRequest create() => QueryGetMonitoringInfoRequest._();
  QueryGetMonitoringInfoRequest createEmptyInstance() => create();
  static $pb.PbList<QueryGetMonitoringInfoRequest> createRepeated() => $pb.PbList<QueryGetMonitoringInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryGetMonitoringInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetMonitoringInfoRequest>(create);
  static QueryGetMonitoringInfoRequest? _defaultInstance;
}

class QueryGetMonitoringInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryGetMonitoringInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..aOM<$5.MonitoringInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MonitoringInfo', protoName: 'MonitoringInfo', subBuilder: $5.MonitoringInfo.create)
    ..hasRequiredFields = false
  ;

  QueryGetMonitoringInfoResponse._() : super();
  factory QueryGetMonitoringInfoResponse({
    $5.MonitoringInfo? monitoringInfo,
  }) {
    final _result = create();
    if (monitoringInfo != null) {
      _result.monitoringInfo = monitoringInfo;
    }
    return _result;
  }
  factory QueryGetMonitoringInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryGetMonitoringInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryGetMonitoringInfoResponse clone() => QueryGetMonitoringInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryGetMonitoringInfoResponse copyWith(void Function(QueryGetMonitoringInfoResponse) updates) => super.copyWith((message) => updates(message as QueryGetMonitoringInfoResponse)) as QueryGetMonitoringInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryGetMonitoringInfoResponse create() => QueryGetMonitoringInfoResponse._();
  QueryGetMonitoringInfoResponse createEmptyInstance() => create();
  static $pb.PbList<QueryGetMonitoringInfoResponse> createRepeated() => $pb.PbList<QueryGetMonitoringInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryGetMonitoringInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryGetMonitoringInfoResponse>(create);
  static QueryGetMonitoringInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $5.MonitoringInfo get monitoringInfo => $_getN(0);
  @$pb.TagNumber(1)
  set monitoringInfo($5.MonitoringInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMonitoringInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonitoringInfo() => clearField(1);
  @$pb.TagNumber(1)
  $5.MonitoringInfo ensureMonitoringInfo() => $_ensure(0);
}

class QueryParamsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryParamsRequest._() : super();
  factory QueryParamsRequest() => create();
  factory QueryParamsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsRequest clone() => QueryParamsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsRequest copyWith(void Function(QueryParamsRequest) updates) => super.copyWith((message) => updates(message as QueryParamsRequest)) as QueryParamsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest create() => QueryParamsRequest._();
  QueryParamsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryParamsRequest> createRepeated() => $pb.PbList<QueryParamsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsRequest>(create);
  static QueryParamsRequest? _defaultInstance;
}

class QueryParamsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..aOM<$6.Params>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'params', subBuilder: $6.Params.create)
    ..hasRequiredFields = false
  ;

  QueryParamsResponse._() : super();
  factory QueryParamsResponse({
    $6.Params? params,
  }) {
    final _result = create();
    if (params != null) {
      _result.params = params;
    }
    return _result;
  }
  factory QueryParamsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsResponse clone() => QueryParamsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsResponse copyWith(void Function(QueryParamsResponse) updates) => super.copyWith((message) => updates(message as QueryParamsResponse)) as QueryParamsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse create() => QueryParamsResponse._();
  QueryParamsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryParamsResponse> createRepeated() => $pb.PbList<QueryParamsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsResponse>(create);
  static QueryParamsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $6.Params get params => $_getN(0);
  @$pb.TagNumber(1)
  set params($6.Params v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => clearField(1);
  @$pb.TagNumber(1)
  $6.Params ensureParams() => $_ensure(0);
}

