///
//  Generated code. Do not modify.
//  source: monitoringp/connection_channel_id.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ConnectionChannelID extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConnectionChannelID', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channelID', protoName: 'channelID')
    ..hasRequiredFields = false
  ;

  ConnectionChannelID._() : super();
  factory ConnectionChannelID({
    $core.String? channelID,
  }) {
    final _result = create();
    if (channelID != null) {
      _result.channelID = channelID;
    }
    return _result;
  }
  factory ConnectionChannelID.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectionChannelID.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectionChannelID clone() => ConnectionChannelID()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectionChannelID copyWith(void Function(ConnectionChannelID) updates) => super.copyWith((message) => updates(message as ConnectionChannelID)) as ConnectionChannelID; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectionChannelID create() => ConnectionChannelID._();
  ConnectionChannelID createEmptyInstance() => create();
  static $pb.PbList<ConnectionChannelID> createRepeated() => $pb.PbList<ConnectionChannelID>();
  @$core.pragma('dart2js:noInline')
  static ConnectionChannelID getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectionChannelID>(create);
  static ConnectionChannelID? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get channelID => $_getSZ(0);
  @$pb.TagNumber(1)
  set channelID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannelID() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannelID() => clearField(1);
}

