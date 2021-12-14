import 'package:starport_template/entities/wallet_additional_data.dart';

class ImportWalletFormData {
  final String mnemonic;
  final String name;
  final String password;
  final WalletAdditionalData additionalData;

  const ImportWalletFormData({
    required this.mnemonic,
    required this.name,
    required this.password,
    required this.additionalData,
  });
}
