///
//  Generated code. Do not modify.
//  source: monitoringp/consumer_client_id.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ConsumerClientID extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConsumerClientID', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientID', protoName: 'clientID')
    ..hasRequiredFields = false
  ;

  ConsumerClientID._() : super();
  factory ConsumerClientID({
    $core.String? clientID,
  }) {
    final _result = create();
    if (clientID != null) {
      _result.clientID = clientID;
    }
    return _result;
  }
  factory ConsumerClientID.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConsumerClientID.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConsumerClientID clone() => ConsumerClientID()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConsumerClientID copyWith(void Function(ConsumerClientID) updates) => super.copyWith((message) => updates(message as ConsumerClientID)) as ConsumerClientID; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConsumerClientID create() => ConsumerClientID._();
  ConsumerClientID createEmptyInstance() => create();
  static $pb.PbList<ConsumerClientID> createRepeated() => $pb.PbList<ConsumerClientID>();
  @$core.pragma('dart2js:noInline')
  static ConsumerClientID getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConsumerClientID>(create);
  static ConsumerClientID? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientID => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClientID() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientID() => clearField(1);
}

