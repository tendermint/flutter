import 'package:wallet_core/wallet_core.dart';

abstract class MnemonicGenerator {
  static String generateMnemonic() => Web3.generateMnemonic();
}