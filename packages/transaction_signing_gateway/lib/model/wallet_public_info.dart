import 'package:equatable/equatable.dart';

class WalletPublicInfo extends Equatable {
  final String name;
  final String publicAddress;
  final String walletId;
  final String chainId;

  const WalletPublicInfo({
    required this.name,
    required this.publicAddress,
    required this.walletId,
    required this.chainId,
  });

  @override
  List<Object?> get props => [
        name,
        publicAddress,
        walletId,
        chainId,
      ];

  WalletPublicInfo copyWith({
    String? name,
    String? publicAddress,
    String? walletId,
    String? chainId,
  }) {
    if ((name == null || identical(name, this.name)) &&
        (publicAddress == null || identical(publicAddress, this.publicAddress)) &&
        (walletId == null || identical(walletId, this.walletId)) &&
        (chainId == null || identical(chainId, this.chainId))) {
      return this;
    }

    return WalletPublicInfo(
      name: name ?? this.name,
      publicAddress: publicAddress ?? this.publicAddress,
      walletId: walletId ?? this.walletId,
      chainId: chainId ?? this.chainId,
    );
  }
}
