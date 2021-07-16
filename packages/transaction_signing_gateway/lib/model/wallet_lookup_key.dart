import 'package:equatable/equatable.dart';

class WalletLookupKey extends Equatable {
  final String chainId;
  final String walletId;
  final String password;

  const WalletLookupKey({
    required this.chainId,
    required this.walletId,
    required this.password,
  });

  @override
  List<Object?> get props => [
        chainId,
        walletId,
        password,
      ];
}
