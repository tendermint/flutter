///
//  Generated code. Do not modify.
//  source: ibc/core/connection/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'connection.pb.dart' as $4;
import '../../client/v1/client.pb.dart' as $9;
import '../../../../cosmos/base/query/v1beta1/pagination.pb.dart' as $10;
import '../../../../google/protobuf/any.pb.dart' as $6;

class QueryConnectionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryConnectionRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionId')
    ..hasRequiredFields = false
  ;

  QueryConnectionRequest._() : super();
  factory QueryConnectionRequest({
    $core.String? connectionId,
  }) {
    final _result = create();
    if (connectionId != null) {
      _result.connectionId = connectionId;
    }
    return _result;
  }
  factory QueryConnectionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryConnectionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryConnectionRequest clone() => QueryConnectionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryConnectionRequest copyWith(void Function(QueryConnectionRequest) updates) => super.copyWith((message) => updates(message as QueryConnectionRequest)) as QueryConnectionRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryConnectionRequest create() => QueryConnectionRequest._();
  QueryConnectionRequest createEmptyInstance() => create();
  static $pb.PbList<QueryConnectionRequest> createRepeated() => $pb.PbList<QueryConnectionRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryConnectionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryConnectionRequest>(create);
  static QueryConnectionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get connectionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set connectionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnectionId() => clearField(1);
}

class QueryConnectionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryConnectionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..aOM<$4.ConnectionEnd>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connection', subBuilder: $4.ConnectionEnd.create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proof', $pb.PbFieldType.OY)
    ..aOM<$9.Height>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proofHeight', subBuilder: $9.Height.create)
    ..hasRequiredFields = false
  ;

  QueryConnectionResponse._() : super();
  factory QueryConnectionResponse({
    $4.ConnectionEnd? connection,
    $core.List<$core.int>? proof,
    $9.Height? proofHeight,
  }) {
    final _result = create();
    if (connection != null) {
      _result.connection = connection;
    }
    if (proof != null) {
      _result.proof = proof;
    }
    if (proofHeight != null) {
      _result.proofHeight = proofHeight;
    }
    return _result;
  }
  factory QueryConnectionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryConnectionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryConnectionResponse clone() => QueryConnectionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryConnectionResponse copyWith(void Function(QueryConnectionResponse) updates) => super.copyWith((message) => updates(message as QueryConnectionResponse)) as QueryConnectionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryConnectionResponse create() => QueryConnectionResponse._();
  QueryConnectionResponse createEmptyInstance() => create();
  static $pb.PbList<QueryConnectionResponse> createRepeated() => $pb.PbList<QueryConnectionResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryConnectionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryConnectionResponse>(create);
  static QueryConnectionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $4.ConnectionEnd get connection => $_getN(0);
  @$pb.TagNumber(1)
  set connection($4.ConnectionEnd v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnection() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnection() => clearField(1);
  @$pb.TagNumber(1)
  $4.ConnectionEnd ensureConnection() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get proof => $_getN(1);
  @$pb.TagNumber(2)
  set proof($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProof() => $_has(1);
  @$pb.TagNumber(2)
  void clearProof() => clearField(2);

  @$pb.TagNumber(3)
  $9.Height get proofHeight => $_getN(2);
  @$pb.TagNumber(3)
  set proofHeight($9.Height v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasProofHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearProofHeight() => clearField(3);
  @$pb.TagNumber(3)
  $9.Height ensureProofHeight() => $_ensure(2);
}

class QueryConnectionsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryConnectionsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..aOM<$10.PageRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $10.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryConnectionsRequest._() : super();
  factory QueryConnectionsRequest({
    $10.PageRequest? pagination,
  }) {
    final _result = create();
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryConnectionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryConnectionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryConnectionsRequest clone() => QueryConnectionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryConnectionsRequest copyWith(void Function(QueryConnectionsRequest) updates) => super.copyWith((message) => updates(message as QueryConnectionsRequest)) as QueryConnectionsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryConnectionsRequest create() => QueryConnectionsRequest._();
  QueryConnectionsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryConnectionsRequest> createRepeated() => $pb.PbList<QueryConnectionsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryConnectionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryConnectionsRequest>(create);
  static QueryConnectionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $10.PageRequest get pagination => $_getN(0);
  @$pb.TagNumber(1)
  set pagination($10.PageRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPagination() => $_has(0);
  @$pb.TagNumber(1)
  void clearPagination() => clearField(1);
  @$pb.TagNumber(1)
  $10.PageRequest ensurePagination() => $_ensure(0);
}

class QueryConnectionsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryConnectionsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..pc<$4.IdentifiedConnection>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connections', $pb.PbFieldType.PM, subBuilder: $4.IdentifiedConnection.create)
    ..aOM<$10.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $10.PageResponse.create)
    ..aOM<$9.Height>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'height', subBuilder: $9.Height.create)
    ..hasRequiredFields = false
  ;

  QueryConnectionsResponse._() : super();
  factory QueryConnectionsResponse({
    $core.Iterable<$4.IdentifiedConnection>? connections,
    $10.PageResponse? pagination,
    $9.Height? height,
  }) {
    final _result = create();
    if (connections != null) {
      _result.connections.addAll(connections);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    if (height != null) {
      _result.height = height;
    }
    return _result;
  }
  factory QueryConnectionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryConnectionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryConnectionsResponse clone() => QueryConnectionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryConnectionsResponse copyWith(void Function(QueryConnectionsResponse) updates) => super.copyWith((message) => updates(message as QueryConnectionsResponse)) as QueryConnectionsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryConnectionsResponse create() => QueryConnectionsResponse._();
  QueryConnectionsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryConnectionsResponse> createRepeated() => $pb.PbList<QueryConnectionsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryConnectionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryConnectionsResponse>(create);
  static QueryConnectionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$4.IdentifiedConnection> get connections => $_getList(0);

  @$pb.TagNumber(2)
  $10.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($10.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $10.PageResponse ensurePagination() => $_ensure(1);

  @$pb.TagNumber(3)
  $9.Height get height => $_getN(2);
  @$pb.TagNumber(3)
  set height($9.Height v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);
  @$pb.TagNumber(3)
  $9.Height ensureHeight() => $_ensure(2);
}

class QueryClientConnectionsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryClientConnectionsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientId')
    ..hasRequiredFields = false
  ;

  QueryClientConnectionsRequest._() : super();
  factory QueryClientConnectionsRequest({
    $core.String? clientId,
  }) {
    final _result = create();
    if (clientId != null) {
      _result.clientId = clientId;
    }
    return _result;
  }
  factory QueryClientConnectionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryClientConnectionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryClientConnectionsRequest clone() => QueryClientConnectionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryClientConnectionsRequest copyWith(void Function(QueryClientConnectionsRequest) updates) => super.copyWith((message) => updates(message as QueryClientConnectionsRequest)) as QueryClientConnectionsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryClientConnectionsRequest create() => QueryClientConnectionsRequest._();
  QueryClientConnectionsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryClientConnectionsRequest> createRepeated() => $pb.PbList<QueryClientConnectionsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryClientConnectionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryClientConnectionsRequest>(create);
  static QueryClientConnectionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientId => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientId() => clearField(1);
}

class QueryClientConnectionsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryClientConnectionsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionPaths')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proof', $pb.PbFieldType.OY)
    ..aOM<$9.Height>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proofHeight', subBuilder: $9.Height.create)
    ..hasRequiredFields = false
  ;

  QueryClientConnectionsResponse._() : super();
  factory QueryClientConnectionsResponse({
    $core.Iterable<$core.String>? connectionPaths,
    $core.List<$core.int>? proof,
    $9.Height? proofHeight,
  }) {
    final _result = create();
    if (connectionPaths != null) {
      _result.connectionPaths.addAll(connectionPaths);
    }
    if (proof != null) {
      _result.proof = proof;
    }
    if (proofHeight != null) {
      _result.proofHeight = proofHeight;
    }
    return _result;
  }
  factory QueryClientConnectionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryClientConnectionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryClientConnectionsResponse clone() => QueryClientConnectionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryClientConnectionsResponse copyWith(void Function(QueryClientConnectionsResponse) updates) => super.copyWith((message) => updates(message as QueryClientConnectionsResponse)) as QueryClientConnectionsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryClientConnectionsResponse create() => QueryClientConnectionsResponse._();
  QueryClientConnectionsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryClientConnectionsResponse> createRepeated() => $pb.PbList<QueryClientConnectionsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryClientConnectionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryClientConnectionsResponse>(create);
  static QueryClientConnectionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get connectionPaths => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get proof => $_getN(1);
  @$pb.TagNumber(2)
  set proof($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProof() => $_has(1);
  @$pb.TagNumber(2)
  void clearProof() => clearField(2);

  @$pb.TagNumber(3)
  $9.Height get proofHeight => $_getN(2);
  @$pb.TagNumber(3)
  set proofHeight($9.Height v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasProofHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearProofHeight() => clearField(3);
  @$pb.TagNumber(3)
  $9.Height ensureProofHeight() => $_ensure(2);
}

class QueryConnectionClientStateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryConnectionClientStateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionId')
    ..hasRequiredFields = false
  ;

  QueryConnectionClientStateRequest._() : super();
  factory QueryConnectionClientStateRequest({
    $core.String? connectionId,
  }) {
    final _result = create();
    if (connectionId != null) {
      _result.connectionId = connectionId;
    }
    return _result;
  }
  factory QueryConnectionClientStateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryConnectionClientStateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryConnectionClientStateRequest clone() => QueryConnectionClientStateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryConnectionClientStateRequest copyWith(void Function(QueryConnectionClientStateRequest) updates) => super.copyWith((message) => updates(message as QueryConnectionClientStateRequest)) as QueryConnectionClientStateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryConnectionClientStateRequest create() => QueryConnectionClientStateRequest._();
  QueryConnectionClientStateRequest createEmptyInstance() => create();
  static $pb.PbList<QueryConnectionClientStateRequest> createRepeated() => $pb.PbList<QueryConnectionClientStateRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryConnectionClientStateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryConnectionClientStateRequest>(create);
  static QueryConnectionClientStateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get connectionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set connectionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnectionId() => clearField(1);
}

class QueryConnectionClientStateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryConnectionClientStateResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..aOM<$9.IdentifiedClientState>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'identifiedClientState', subBuilder: $9.IdentifiedClientState.create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proof', $pb.PbFieldType.OY)
    ..aOM<$9.Height>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proofHeight', subBuilder: $9.Height.create)
    ..hasRequiredFields = false
  ;

  QueryConnectionClientStateResponse._() : super();
  factory QueryConnectionClientStateResponse({
    $9.IdentifiedClientState? identifiedClientState,
    $core.List<$core.int>? proof,
    $9.Height? proofHeight,
  }) {
    final _result = create();
    if (identifiedClientState != null) {
      _result.identifiedClientState = identifiedClientState;
    }
    if (proof != null) {
      _result.proof = proof;
    }
    if (proofHeight != null) {
      _result.proofHeight = proofHeight;
    }
    return _result;
  }
  factory QueryConnectionClientStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryConnectionClientStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryConnectionClientStateResponse clone() => QueryConnectionClientStateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryConnectionClientStateResponse copyWith(void Function(QueryConnectionClientStateResponse) updates) => super.copyWith((message) => updates(message as QueryConnectionClientStateResponse)) as QueryConnectionClientStateResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryConnectionClientStateResponse create() => QueryConnectionClientStateResponse._();
  QueryConnectionClientStateResponse createEmptyInstance() => create();
  static $pb.PbList<QueryConnectionClientStateResponse> createRepeated() => $pb.PbList<QueryConnectionClientStateResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryConnectionClientStateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryConnectionClientStateResponse>(create);
  static QueryConnectionClientStateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $9.IdentifiedClientState get identifiedClientState => $_getN(0);
  @$pb.TagNumber(1)
  set identifiedClientState($9.IdentifiedClientState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdentifiedClientState() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifiedClientState() => clearField(1);
  @$pb.TagNumber(1)
  $9.IdentifiedClientState ensureIdentifiedClientState() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get proof => $_getN(1);
  @$pb.TagNumber(2)
  set proof($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProof() => $_has(1);
  @$pb.TagNumber(2)
  void clearProof() => clearField(2);

  @$pb.TagNumber(3)
  $9.Height get proofHeight => $_getN(2);
  @$pb.TagNumber(3)
  set proofHeight($9.Height v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasProofHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearProofHeight() => clearField(3);
  @$pb.TagNumber(3)
  $9.Height ensureProofHeight() => $_ensure(2);
}

class QueryConnectionConsensusStateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryConnectionConsensusStateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionId')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'revisionNumber', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'revisionHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryConnectionConsensusStateRequest._() : super();
  factory QueryConnectionConsensusStateRequest({
    $core.String? connectionId,
    $fixnum.Int64? revisionNumber,
    $fixnum.Int64? revisionHeight,
  }) {
    final _result = create();
    if (connectionId != null) {
      _result.connectionId = connectionId;
    }
    if (revisionNumber != null) {
      _result.revisionNumber = revisionNumber;
    }
    if (revisionHeight != null) {
      _result.revisionHeight = revisionHeight;
    }
    return _result;
  }
  factory QueryConnectionConsensusStateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryConnectionConsensusStateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryConnectionConsensusStateRequest clone() => QueryConnectionConsensusStateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryConnectionConsensusStateRequest copyWith(void Function(QueryConnectionConsensusStateRequest) updates) => super.copyWith((message) => updates(message as QueryConnectionConsensusStateRequest)) as QueryConnectionConsensusStateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryConnectionConsensusStateRequest create() => QueryConnectionConsensusStateRequest._();
  QueryConnectionConsensusStateRequest createEmptyInstance() => create();
  static $pb.PbList<QueryConnectionConsensusStateRequest> createRepeated() => $pb.PbList<QueryConnectionConsensusStateRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryConnectionConsensusStateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryConnectionConsensusStateRequest>(create);
  static QueryConnectionConsensusStateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get connectionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set connectionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnectionId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get revisionNumber => $_getI64(1);
  @$pb.TagNumber(2)
  set revisionNumber($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRevisionNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearRevisionNumber() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get revisionHeight => $_getI64(2);
  @$pb.TagNumber(3)
  set revisionHeight($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRevisionHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearRevisionHeight() => clearField(3);
}

class QueryConnectionConsensusStateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryConnectionConsensusStateResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ibc.core.connection.v1'), createEmptyInstance: create)
    ..aOM<$6.Any>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consensusState', subBuilder: $6.Any.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientId')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proof', $pb.PbFieldType.OY)
    ..aOM<$9.Height>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proofHeight', subBuilder: $9.Height.create)
    ..hasRequiredFields = false
  ;

  QueryConnectionConsensusStateResponse._() : super();
  factory QueryConnectionConsensusStateResponse({
    $6.Any? consensusState,
    $core.String? clientId,
    $core.List<$core.int>? proof,
    $9.Height? proofHeight,
  }) {
    final _result = create();
    if (consensusState != null) {
      _result.consensusState = consensusState;
    }
    if (clientId != null) {
      _result.clientId = clientId;
    }
    if (proof != null) {
      _result.proof = proof;
    }
    if (proofHeight != null) {
      _result.proofHeight = proofHeight;
    }
    return _result;
  }
  factory QueryConnectionConsensusStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryConnectionConsensusStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryConnectionConsensusStateResponse clone() => QueryConnectionConsensusStateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryConnectionConsensusStateResponse copyWith(void Function(QueryConnectionConsensusStateResponse) updates) => super.copyWith((message) => updates(message as QueryConnectionConsensusStateResponse)) as QueryConnectionConsensusStateResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryConnectionConsensusStateResponse create() => QueryConnectionConsensusStateResponse._();
  QueryConnectionConsensusStateResponse createEmptyInstance() => create();
  static $pb.PbList<QueryConnectionConsensusStateResponse> createRepeated() => $pb.PbList<QueryConnectionConsensusStateResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryConnectionConsensusStateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryConnectionConsensusStateResponse>(create);
  static QueryConnectionConsensusStateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $6.Any get consensusState => $_getN(0);
  @$pb.TagNumber(1)
  set consensusState($6.Any v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConsensusState() => $_has(0);
  @$pb.TagNumber(1)
  void clearConsensusState() => clearField(1);
  @$pb.TagNumber(1)
  $6.Any ensureConsensusState() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get proof => $_getN(2);
  @$pb.TagNumber(3)
  set proof($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProof() => $_has(2);
  @$pb.TagNumber(3)
  void clearProof() => clearField(3);

  @$pb.TagNumber(4)
  $9.Height get proofHeight => $_getN(3);
  @$pb.TagNumber(4)
  set proofHeight($9.Height v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasProofHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearProofHeight() => clearField(4);
  @$pb.TagNumber(4)
  $9.Height ensureProofHeight() => $_ensure(3);
}

