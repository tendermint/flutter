import 'package:cosmos_node_client/account/account.dart';
import 'package:cosmos_node_client/account/mnemonic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'bech32address from 12-word mnemonic is valid',
    () async {
      final account1 = await Account.derive(
        _words12Mnemonic,
        bech32Hrp: 'cosmos',
      );
      final account2 = await Account.derive(
        _words12Mnemonic,
        bech32Hrp: 'cosmos',
        derivationPath: "m/44'/118'/0'/0/1",
      );
      final account3 = await Account.derive(
        _words12Mnemonic,
        bech32Hrp: 'cosmos',
        derivationPath: "m/44'/118'/0'/0/2",
      );

      expect(account1.isRight(), isTrue);
      expect(account1.getOrElse(() => throw '').bech32Address, 'cosmos1aeklthxkehug0n3cgm05vjcfv6lvx3zgcm7tx8');

      expect(account2.isRight(), isTrue);
      expect(account2.getOrElse(() => throw '').bech32Address, 'cosmos1vuqlflsnwymtwdgrwelj7qr6zlah443h2ytkjr');

      expect(account3.isRight(), isTrue);
      expect(account3.getOrElse(() => throw '').bech32Address, 'cosmos13pv8ahrrz8dg4rg6g3ur9zdreya6f5lejau8w5');
    },
  );

  test(
    'bech32address from 24-word mnemonic is valid',
    () async {
      final account1 = await Account.derive(
        _words24Mnemonic,
        bech32Hrp: 'cosmos',
      );
      final account2 = await Account.derive(
        _words24Mnemonic,
        bech32Hrp: 'cosmos',
        derivationPath: "m/44'/118'/0'/0/1",
      );
      final account3 = await Account.derive(
        _words24Mnemonic,
        bech32Hrp: 'cosmos',
        derivationPath: "m/44'/118'/0'/0/2",
      );

      expect(account1.isRight(), isTrue);
      expect(account1.getOrElse(() => throw '').bech32Address, 'cosmos192r5m2l8m9w7wgqmck497vcnd3zqta4d8l0xjt');

      expect(account2.isRight(), isTrue);
      expect(account2.getOrElse(() => throw '').bech32Address, 'cosmos176phqn0z2jp6xuek8cfhsrqa3s45qpes7ank5u');

      expect(account3.isRight(), isTrue);
      expect(account3.getOrElse(() => throw '').bech32Address, 'cosmos1z8sgtqq29dw2ejfyg28yfrekfwrjme8v8spk2h');
    },
  );
}

const _words12Mnemonic = Mnemonic('tackle merit banner page pulse clean good behave bridge exchange sail tribe');
const _words24Mnemonic = Mnemonic(
  'movie tiny range scorpion silver reunion science essence lawn cushion goddess pilot act mosquito village same hobby radio unfold elder help riot sadness face',
);
