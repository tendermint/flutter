///
//  Generated code. Do not modify.
//  source: monitoringp/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $0;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$consumerClientID = $grpc.ClientMethod<
          $0.QueryGetConsumerClientIDRequest,
          $0.QueryGetConsumerClientIDResponse>(
      '/tendermint.spn.monitoringp.Query/ConsumerClientID',
      ($0.QueryGetConsumerClientIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryGetConsumerClientIDResponse.fromBuffer(value));
  static final _$connectionChannelID = $grpc.ClientMethod<
          $0.QueryGetConnectionChannelIDRequest,
          $0.QueryGetConnectionChannelIDResponse>(
      '/tendermint.spn.monitoringp.Query/ConnectionChannelID',
      ($0.QueryGetConnectionChannelIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryGetConnectionChannelIDResponse.fromBuffer(value));
  static final _$monitoringInfo = $grpc.ClientMethod<
          $0.QueryGetMonitoringInfoRequest, $0.QueryGetMonitoringInfoResponse>(
      '/tendermint.spn.monitoringp.Query/MonitoringInfo',
      ($0.QueryGetMonitoringInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.QueryGetMonitoringInfoResponse.fromBuffer(value));
  static final _$params =
      $grpc.ClientMethod<$0.QueryParamsRequest, $0.QueryParamsResponse>(
          '/tendermint.spn.monitoringp.Query/Params',
          ($0.QueryParamsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryParamsResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QueryGetConsumerClientIDResponse> consumerClientID(
      $0.QueryGetConsumerClientIDRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$consumerClientID, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryGetConnectionChannelIDResponse>
      connectionChannelID($0.QueryGetConnectionChannelIDRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$connectionChannelID, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryGetMonitoringInfoResponse> monitoringInfo(
      $0.QueryGetMonitoringInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$monitoringInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryParamsResponse> params(
      $0.QueryParamsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$params, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'tendermint.spn.monitoringp.Query';

  QueryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.QueryGetConsumerClientIDRequest,
            $0.QueryGetConsumerClientIDResponse>(
        'ConsumerClientID',
        consumerClientID_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryGetConsumerClientIDRequest.fromBuffer(value),
        ($0.QueryGetConsumerClientIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryGetConnectionChannelIDRequest,
            $0.QueryGetConnectionChannelIDResponse>(
        'ConnectionChannelID',
        connectionChannelID_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryGetConnectionChannelIDRequest.fromBuffer(value),
        ($0.QueryGetConnectionChannelIDResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.QueryGetMonitoringInfoRequest,
            $0.QueryGetMonitoringInfoResponse>(
        'MonitoringInfo',
        monitoringInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.QueryGetMonitoringInfoRequest.fromBuffer(value),
        ($0.QueryGetMonitoringInfoResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.QueryParamsRequest, $0.QueryParamsResponse>(
            'Params',
            params_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryParamsRequest.fromBuffer(value),
            ($0.QueryParamsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.QueryGetConsumerClientIDResponse> consumerClientID_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryGetConsumerClientIDRequest> request) async {
    return consumerClientID(call, await request);
  }

  $async.Future<$0.QueryGetConnectionChannelIDResponse> connectionChannelID_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryGetConnectionChannelIDRequest> request) async {
    return connectionChannelID(call, await request);
  }

  $async.Future<$0.QueryGetMonitoringInfoResponse> monitoringInfo_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.QueryGetMonitoringInfoRequest> request) async {
    return monitoringInfo(call, await request);
  }

  $async.Future<$0.QueryParamsResponse> params_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryParamsRequest> request) async {
    return params(call, await request);
  }

  $async.Future<$0.QueryGetConsumerClientIDResponse> consumerClientID(
      $grpc.ServiceCall call, $0.QueryGetConsumerClientIDRequest request);
  $async.Future<$0.QueryGetConnectionChannelIDResponse> connectionChannelID(
      $grpc.ServiceCall call, $0.QueryGetConnectionChannelIDRequest request);
  $async.Future<$0.QueryGetMonitoringInfoResponse> monitoringInfo(
      $grpc.ServiceCall call, $0.QueryGetMonitoringInfoRequest request);
  $async.Future<$0.QueryParamsResponse> params(
      $grpc.ServiceCall call, $0.QueryParamsRequest request);
}
