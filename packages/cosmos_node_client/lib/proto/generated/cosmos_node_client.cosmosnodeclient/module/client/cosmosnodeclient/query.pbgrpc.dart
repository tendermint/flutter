///
//  Generated code. Do not modify.
//  source: cosmosnodeclient/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $0;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$params =
      $grpc.ClientMethod<$0.QueryParamsRequest, $0.QueryParamsResponse>(
          '/cosmos_node_client.cosmosnodeclient.Query/Params',
          ($0.QueryParamsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryParamsResponse.fromBuffer(value));
  static final _$post =
      $grpc.ClientMethod<$0.QueryGetPostRequest, $0.QueryGetPostResponse>(
          '/cosmos_node_client.cosmosnodeclient.Query/Post',
          ($0.QueryGetPostRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryGetPostResponse.fromBuffer(value));
  static final _$postAll =
      $grpc.ClientMethod<$0.QueryAllPostRequest, $0.QueryAllPostResponse>(
          '/cosmos_node_client.cosmosnodeclient.Query/PostAll',
          ($0.QueryAllPostRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.QueryAllPostResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QueryParamsResponse> params(
      $0.QueryParamsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$params, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryGetPostResponse> post(
      $0.QueryGetPostRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$post, request, options: options);
  }

  $grpc.ResponseFuture<$0.QueryAllPostResponse> postAll(
      $0.QueryAllPostRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$postAll, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'cosmos_node_client.cosmosnodeclient.Query';

  QueryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.QueryParamsRequest, $0.QueryParamsResponse>(
            'Params',
            params_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryParamsRequest.fromBuffer(value),
            ($0.QueryParamsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.QueryGetPostRequest, $0.QueryGetPostResponse>(
            'Post',
            post_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryGetPostRequest.fromBuffer(value),
            ($0.QueryGetPostResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.QueryAllPostRequest, $0.QueryAllPostResponse>(
            'PostAll',
            postAll_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.QueryAllPostRequest.fromBuffer(value),
            ($0.QueryAllPostResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.QueryParamsResponse> params_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryParamsRequest> request) async {
    return params(call, await request);
  }

  $async.Future<$0.QueryGetPostResponse> post_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryGetPostRequest> request) async {
    return post(call, await request);
  }

  $async.Future<$0.QueryAllPostResponse> postAll_Pre($grpc.ServiceCall call,
      $async.Future<$0.QueryAllPostRequest> request) async {
    return postAll(call, await request);
  }

  $async.Future<$0.QueryParamsResponse> params(
      $grpc.ServiceCall call, $0.QueryParamsRequest request);
  $async.Future<$0.QueryGetPostResponse> post(
      $grpc.ServiceCall call, $0.QueryGetPostRequest request);
  $async.Future<$0.QueryAllPostResponse> postAll(
      $grpc.ServiceCall call, $0.QueryAllPostRequest request);
}
