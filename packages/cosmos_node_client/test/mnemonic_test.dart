import 'package:cosmos_node_client/account/mnemonic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'value should be words joined with space',
    () => expect(Mnemonic.fromWords(_words).value, _words.join(' ')),
  );

  test(
    'words should be value split with space',
    () async => expect(
      Mnemonic(_words.join(' ')).words,
      _words,
    ),
  );

  test(
    'should generate  mnemonic with 12 words',
    () async => expect((await Mnemonic.generate(MnemonicLength.words12)).words.length, 12),
  );

  test(
    'should generate mnemonic with 24 words',
    () async => expect((await Mnemonic.generate(MnemonicLength.words24)).words.length, 24),
  );
}

final _words = [
  'bike',
  'child',
  'finish',
  'slide',
  'general',
  'track',
  'appear',
  'youth',
  'lucky',
  'damage',
  'lesson',
  'divorce'
];
