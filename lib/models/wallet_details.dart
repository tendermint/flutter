class BaseWalletDetails {
  final String walletAddress;
  final String walletAlias;
  final WalletType walletType;

  const BaseWalletDetails({
    required this.walletType,
    required this.walletAlias,
    required this.walletAddress,
  });
}

enum WalletType { Eth, Cosmos }