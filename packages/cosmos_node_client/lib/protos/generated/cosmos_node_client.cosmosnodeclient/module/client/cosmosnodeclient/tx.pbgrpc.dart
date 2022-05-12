///
//  Generated code. Do not modify.
//  source: cosmosnodeclient/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tx.pb.dart' as $1;
export 'tx.pb.dart';

class MsgClient extends $grpc.Client {
  static final _$createPost =
      $grpc.ClientMethod<$1.MsgCreatePost, $1.MsgCreatePostResponse>(
          '/cosmos_node_client.cosmosnodeclient.Msg/CreatePost',
          ($1.MsgCreatePost value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.MsgCreatePostResponse.fromBuffer(value));
  static final _$updatePost =
      $grpc.ClientMethod<$1.MsgUpdatePost, $1.MsgUpdatePostResponse>(
          '/cosmos_node_client.cosmosnodeclient.Msg/UpdatePost',
          ($1.MsgUpdatePost value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.MsgUpdatePostResponse.fromBuffer(value));
  static final _$deletePost =
      $grpc.ClientMethod<$1.MsgDeletePost, $1.MsgDeletePostResponse>(
          '/cosmos_node_client.cosmosnodeclient.Msg/DeletePost',
          ($1.MsgDeletePost value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.MsgDeletePostResponse.fromBuffer(value));

  MsgClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.MsgCreatePostResponse> createPost(
      $1.MsgCreatePost request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPost, request, options: options);
  }

  $grpc.ResponseFuture<$1.MsgUpdatePostResponse> updatePost(
      $1.MsgUpdatePost request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.MsgDeletePostResponse> deletePost(
      $1.MsgDeletePost request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePost, request, options: options);
  }
}

abstract class MsgServiceBase extends $grpc.Service {
  $core.String get $name => 'cosmos_node_client.cosmosnodeclient.Msg';

  MsgServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.MsgCreatePost, $1.MsgCreatePostResponse>(
        'CreatePost',
        createPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.MsgCreatePost.fromBuffer(value),
        ($1.MsgCreatePostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.MsgUpdatePost, $1.MsgUpdatePostResponse>(
        'UpdatePost',
        updatePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.MsgUpdatePost.fromBuffer(value),
        ($1.MsgUpdatePostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.MsgDeletePost, $1.MsgDeletePostResponse>(
        'DeletePost',
        deletePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.MsgDeletePost.fromBuffer(value),
        ($1.MsgDeletePostResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.MsgCreatePostResponse> createPost_Pre(
      $grpc.ServiceCall call, $async.Future<$1.MsgCreatePost> request) async {
    return createPost(call, await request);
  }

  $async.Future<$1.MsgUpdatePostResponse> updatePost_Pre(
      $grpc.ServiceCall call, $async.Future<$1.MsgUpdatePost> request) async {
    return updatePost(call, await request);
  }

  $async.Future<$1.MsgDeletePostResponse> deletePost_Pre(
      $grpc.ServiceCall call, $async.Future<$1.MsgDeletePost> request) async {
    return deletePost(call, await request);
  }

  $async.Future<$1.MsgCreatePostResponse> createPost(
      $grpc.ServiceCall call, $1.MsgCreatePost request);
  $async.Future<$1.MsgUpdatePostResponse> updatePost(
      $grpc.ServiceCall call, $1.MsgUpdatePost request);
  $async.Future<$1.MsgDeletePostResponse> deletePost(
      $grpc.ServiceCall call, $1.MsgDeletePost request);
}
