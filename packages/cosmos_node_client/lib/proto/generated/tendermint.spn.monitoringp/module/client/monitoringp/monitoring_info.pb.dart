///
//  Generated code. Do not modify.
//  source: monitoringp/monitoring_info.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../types/monitoring.pb.dart' as $2;

class MonitoringInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MonitoringInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transmitted')
    ..aOM<$2.SignatureCounts>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signatureCounts', protoName: 'signatureCounts', subBuilder: $2.SignatureCounts.create)
    ..hasRequiredFields = false
  ;

  MonitoringInfo._() : super();
  factory MonitoringInfo({
    $core.bool? transmitted,
    $2.SignatureCounts? signatureCounts,
  }) {
    final _result = create();
    if (transmitted != null) {
      _result.transmitted = transmitted;
    }
    if (signatureCounts != null) {
      _result.signatureCounts = signatureCounts;
    }
    return _result;
  }
  factory MonitoringInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonitoringInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonitoringInfo clone() => MonitoringInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonitoringInfo copyWith(void Function(MonitoringInfo) updates) => super.copyWith((message) => updates(message as MonitoringInfo)) as MonitoringInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MonitoringInfo create() => MonitoringInfo._();
  MonitoringInfo createEmptyInstance() => create();
  static $pb.PbList<MonitoringInfo> createRepeated() => $pb.PbList<MonitoringInfo>();
  @$core.pragma('dart2js:noInline')
  static MonitoringInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonitoringInfo>(create);
  static MonitoringInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get transmitted => $_getBF(0);
  @$pb.TagNumber(1)
  set transmitted($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransmitted() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransmitted() => clearField(1);

  @$pb.TagNumber(2)
  $2.SignatureCounts get signatureCounts => $_getN(1);
  @$pb.TagNumber(2)
  set signatureCounts($2.SignatureCounts v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignatureCounts() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignatureCounts() => clearField(2);
  @$pb.TagNumber(2)
  $2.SignatureCounts ensureSignatureCounts() => $_ensure(1);
}

