import 'package:equatable/equatable.dart';

class WalletLookupKey extends Equatable {
  const WalletLookupKey({
    required this.chainId,
    required this.walletId,
    required this.password,
  });

  final String chainId;
  final String walletId;
  final String password;

  @override
  List<Object?> get props => [
        chainId,
        walletId,
        password,
      ];
}
