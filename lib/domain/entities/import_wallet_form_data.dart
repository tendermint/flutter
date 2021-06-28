import 'package:equatable/equatable.dart';

class ImportWalletFormData extends Equatable {
  final String mnemonic;
  final String alias;

  const ImportWalletFormData({
    required this.mnemonic,
    required this.alias,
  });

  @override
  List<Object> get props => [
        mnemonic,
        alias,
      ];
}
