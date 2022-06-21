import 'dart:typed_data';

import 'package:bech32/bech32.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:cosmos_node_client/account/account_derivation_failure.dart';
import 'package:cosmos_node_client/account/mnemonic.dart';
import 'package:cosmos_node_client/utils/bip32.dart';
import 'package:cosmos_node_client/utils/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hex/hex.dart';
import 'package:pointycastle/export.dart';

class Account extends Equatable {
  const Account({
    required this.bech32Hrp,
    required this.publicKey,
    required this.address,
    required this.privateKey,
  });

  static const defaultDerivationPath = "m/44'/118'/0'/0/0";

  final Uint8List publicKey;
  final Uint8List privateKey;
  final Uint8List address;
  final String bech32Hrp;

  static Future<Either<AccountDerivationFailure, Account>> derive(
    Mnemonic mnemonic, {
    required String bech32Hrp,
    String derivationPath = defaultDerivationPath,
  }) async {
    if (!mnemonic.isValid()) {
      return left(const AccountDerivationFailure.invalidMnemonic());
    }

    // Convert the mnemonic to a BIP32 instance
    final seed = bip39.mnemonicToSeed(mnemonic.value);
    final root = Bip32.fromSeed(seed);

    // Get the node from the derivation path
    final derivedNode = root.derivePath(derivationPath);

    // Get the curve data
    final secp256k1 = ECCurve_secp256k1();
    final point = secp256k1.G;

    // Compute the curve point associated to the private key
    final bigInt = BigInt.parse(HEX.encode(derivedNode.privateKey!), radix: 16);
    final curvePoint = point * bigInt;

    // Get the public key
    final publicKeyBytes = curvePoint!.getEncoded();

    // Get the address
    final sha256Digest = SHA256Digest().process(publicKeyBytes);
    final address = RIPEMD160Digest().process(sha256Digest);

    // Return the key bytes
    return right(
      Account(
        bech32Hrp: bech32Hrp,
        address: address,
        publicKey: publicKeyBytes,
        privateKey: derivedNode.privateKey!,
      ),
    );
  }

  String get bech32Address {
    return Bech32Encoder().convert(Bech32(bech32Hrp, convertBits(address, from: 8, to: 5)));
  }

  @override
  List<Object?> get props => [
        publicKey,
        privateKey,
        address,
      ];
}
