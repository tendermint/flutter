import 'package:equatable/equatable.dart';

class PrivateWalletCredentials extends Equatable {
  final String mnemonic;
  final String chainId;
  final String walletId;

  const PrivateWalletCredentials({
    required this.mnemonic,
    required this.chainId,
    required this.walletId,
  });

  static PrivateWalletCredentials? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PrivateWalletCredentials(
      mnemonic: json['mnemonic'] as String? ?? "",
      chainId: json['chain_id'] as String? ?? "",
      walletId: json['wallet_id'] as String? ?? "",
    );
  }

  @override
  List<Object?> get props => [
        mnemonic,
        chainId,
        walletId,
      ];

  Map<String, dynamic> toJson() => {
        "mnemonic": mnemonic,
        "chain_id": chainId,
        "wallet_id": walletId,
      };
}
