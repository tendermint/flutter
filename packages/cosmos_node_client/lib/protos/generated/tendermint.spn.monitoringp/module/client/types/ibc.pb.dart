///
//  Generated code. Do not modify.
//  source: types/ibc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MerkleRoot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MerkleRoot', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash')
    ..hasRequiredFields = false
  ;

  MerkleRoot._() : super();
  factory MerkleRoot({
    $core.String? hash,
  }) {
    final _result = create();
    if (hash != null) {
      _result.hash = hash;
    }
    return _result;
  }
  factory MerkleRoot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MerkleRoot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MerkleRoot clone() => MerkleRoot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MerkleRoot copyWith(void Function(MerkleRoot) updates) => super.copyWith((message) => updates(message as MerkleRoot)) as MerkleRoot; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MerkleRoot create() => MerkleRoot._();
  MerkleRoot createEmptyInstance() => create();
  static $pb.PbList<MerkleRoot> createRepeated() => $pb.PbList<MerkleRoot>();
  @$core.pragma('dart2js:noInline')
  static MerkleRoot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MerkleRoot>(create);
  static MerkleRoot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);
}

class ConsensusState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConsensusState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nextValidatorsHash', protoName: 'nextValidatorsHash')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp')
    ..aOM<MerkleRoot>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'root', subBuilder: MerkleRoot.create)
    ..hasRequiredFields = false
  ;

  ConsensusState._() : super();
  factory ConsensusState({
    $core.String? nextValidatorsHash,
    $core.String? timestamp,
    MerkleRoot? root,
  }) {
    final _result = create();
    if (nextValidatorsHash != null) {
      _result.nextValidatorsHash = nextValidatorsHash;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (root != null) {
      _result.root = root;
    }
    return _result;
  }
  factory ConsensusState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConsensusState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConsensusState clone() => ConsensusState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConsensusState copyWith(void Function(ConsensusState) updates) => super.copyWith((message) => updates(message as ConsensusState)) as ConsensusState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConsensusState create() => ConsensusState._();
  ConsensusState createEmptyInstance() => create();
  static $pb.PbList<ConsensusState> createRepeated() => $pb.PbList<ConsensusState>();
  @$core.pragma('dart2js:noInline')
  static ConsensusState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConsensusState>(create);
  static ConsensusState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get nextValidatorsHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set nextValidatorsHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNextValidatorsHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearNextValidatorsHash() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get timestamp => $_getSZ(1);
  @$pb.TagNumber(2)
  set timestamp($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => clearField(2);

  @$pb.TagNumber(3)
  MerkleRoot get root => $_getN(2);
  @$pb.TagNumber(3)
  set root(MerkleRoot v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoot() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoot() => clearField(3);
  @$pb.TagNumber(3)
  MerkleRoot ensureRoot() => $_ensure(2);
}

class PubKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PubKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..hasRequiredFields = false
  ;

  PubKey._() : super();
  factory PubKey({
    $core.String? type,
    $core.String? value,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory PubKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PubKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PubKey clone() => PubKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PubKey copyWith(void Function(PubKey) updates) => super.copyWith((message) => updates(message as PubKey)) as PubKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PubKey create() => PubKey._();
  PubKey createEmptyInstance() => create();
  static $pb.PbList<PubKey> createRepeated() => $pb.PbList<PubKey>();
  @$core.pragma('dart2js:noInline')
  static PubKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PubKey>(create);
  static PubKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class Validator extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Validator', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposerPriority', protoName: 'proposerPriority')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'votingPower', protoName: 'votingPower')
    ..aOM<PubKey>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pubKey', protoName: 'pubKey', subBuilder: PubKey.create)
    ..hasRequiredFields = false
  ;

  Validator._() : super();
  factory Validator({
    $core.String? proposerPriority,
    $core.String? votingPower,
    PubKey? pubKey,
  }) {
    final _result = create();
    if (proposerPriority != null) {
      _result.proposerPriority = proposerPriority;
    }
    if (votingPower != null) {
      _result.votingPower = votingPower;
    }
    if (pubKey != null) {
      _result.pubKey = pubKey;
    }
    return _result;
  }
  factory Validator.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Validator.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Validator clone() => Validator()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Validator copyWith(void Function(Validator) updates) => super.copyWith((message) => updates(message as Validator)) as Validator; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Validator create() => Validator._();
  Validator createEmptyInstance() => create();
  static $pb.PbList<Validator> createRepeated() => $pb.PbList<Validator>();
  @$core.pragma('dart2js:noInline')
  static Validator getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Validator>(create);
  static Validator? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get proposerPriority => $_getSZ(0);
  @$pb.TagNumber(1)
  set proposerPriority($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposerPriority() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposerPriority() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get votingPower => $_getSZ(1);
  @$pb.TagNumber(2)
  set votingPower($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVotingPower() => $_has(1);
  @$pb.TagNumber(2)
  void clearVotingPower() => clearField(2);

  @$pb.TagNumber(3)
  PubKey get pubKey => $_getN(2);
  @$pb.TagNumber(3)
  set pubKey(PubKey v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPubKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPubKey() => clearField(3);
  @$pb.TagNumber(3)
  PubKey ensurePubKey() => $_ensure(2);
}

class ValidatorSet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValidatorSet', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'tendermint.spn.types'), createEmptyInstance: create)
    ..pc<Validator>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validators', $pb.PbFieldType.PM, subBuilder: Validator.create)
    ..hasRequiredFields = false
  ;

  ValidatorSet._() : super();
  factory ValidatorSet({
    $core.Iterable<Validator>? validators,
  }) {
    final _result = create();
    if (validators != null) {
      _result.validators.addAll(validators);
    }
    return _result;
  }
  factory ValidatorSet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidatorSet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidatorSet clone() => ValidatorSet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidatorSet copyWith(void Function(ValidatorSet) updates) => super.copyWith((message) => updates(message as ValidatorSet)) as ValidatorSet; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValidatorSet create() => ValidatorSet._();
  ValidatorSet createEmptyInstance() => create();
  static $pb.PbList<ValidatorSet> createRepeated() => $pb.PbList<ValidatorSet>();
  @$core.pragma('dart2js:noInline')
  static ValidatorSet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidatorSet>(create);
  static ValidatorSet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Validator> get validators => $_getList(0);
}

