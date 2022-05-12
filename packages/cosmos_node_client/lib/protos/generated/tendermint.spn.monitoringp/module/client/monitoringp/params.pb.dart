///
//  Generated code. Do not modify.
//  source: monitoringp/params.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../types/ibc.pb.dart' as $1;

class Params extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Params', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.monitoringp'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastBlockHeight', protoName: 'lastBlockHeight')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consumerChainID', protoName: 'consumerChainID')
    ..aOM<$1.ConsensusState>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consumerConsensusState', protoName: 'consumerConsensusState', subBuilder: $1.ConsensusState.create)
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consumerUnbondingPeriod', protoName: 'consumerUnbondingPeriod')
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consumerRevisionHeight', $pb.PbFieldType.OU6, protoName: 'consumerRevisionHeight', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Params._() : super();
  factory Params({
    $fixnum.Int64? lastBlockHeight,
    $core.String? consumerChainID,
    $1.ConsensusState? consumerConsensusState,
    $fixnum.Int64? consumerUnbondingPeriod,
    $fixnum.Int64? consumerRevisionHeight,
  }) {
    final _result = create();
    if (lastBlockHeight != null) {
      _result.lastBlockHeight = lastBlockHeight;
    }
    if (consumerChainID != null) {
      _result.consumerChainID = consumerChainID;
    }
    if (consumerConsensusState != null) {
      _result.consumerConsensusState = consumerConsensusState;
    }
    if (consumerUnbondingPeriod != null) {
      _result.consumerUnbondingPeriod = consumerUnbondingPeriod;
    }
    if (consumerRevisionHeight != null) {
      _result.consumerRevisionHeight = consumerRevisionHeight;
    }
    return _result;
  }
  factory Params.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Params.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Params clone() => Params()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Params copyWith(void Function(Params) updates) => super.copyWith((message) => updates(message as Params)) as Params; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Params create() => Params._();
  Params createEmptyInstance() => create();
  static $pb.PbList<Params> createRepeated() => $pb.PbList<Params>();
  @$core.pragma('dart2js:noInline')
  static Params getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Params>(create);
  static Params? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get lastBlockHeight => $_getI64(0);
  @$pb.TagNumber(1)
  set lastBlockHeight($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastBlockHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastBlockHeight() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get consumerChainID => $_getSZ(1);
  @$pb.TagNumber(2)
  set consumerChainID($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasConsumerChainID() => $_has(1);
  @$pb.TagNumber(2)
  void clearConsumerChainID() => clearField(2);

  @$pb.TagNumber(3)
  $1.ConsensusState get consumerConsensusState => $_getN(2);
  @$pb.TagNumber(3)
  set consumerConsensusState($1.ConsensusState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasConsumerConsensusState() => $_has(2);
  @$pb.TagNumber(3)
  void clearConsumerConsensusState() => clearField(3);
  @$pb.TagNumber(3)
  $1.ConsensusState ensureConsumerConsensusState() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get consumerUnbondingPeriod => $_getI64(3);
  @$pb.TagNumber(4)
  set consumerUnbondingPeriod($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasConsumerUnbondingPeriod() => $_has(3);
  @$pb.TagNumber(4)
  void clearConsumerUnbondingPeriod() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get consumerRevisionHeight => $_getI64(4);
  @$pb.TagNumber(5)
  set consumerRevisionHeight($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasConsumerRevisionHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearConsumerRevisionHeight() => clearField(5);
}

