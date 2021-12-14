import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('validate mnemonic', () async {
    expect(validateMnemonic('words are words'), MnemonicValidationError.WrongNumberOfWords);
    expect(validateMnemonic('invalid character!'), MnemonicValidationError.InvalidCharacter);
    expect(validateMnemonic(''), MnemonicValidationError.MnemonicEmpty);
    expect(
      validateMnemonic(
        'pink later snow hire pill message improve jeans supply reflect wave right silent inflict '
        'fiction riot hurdle belt awkward zero direct will giant dose',
      ),
      MnemonicValidationError.Unknown,
    );
    expect(
      validateMnemonic(
        'later pink snow hire pill message improve jeans supply reflect '
        'wave right silent inflict fiction riot hurdle belt awkward zero direct will giant dose',
      ),
      null,
    );
    expect(
      validateMnemonic('delay cruise little equip orange dolphin jealous fluid little nurse cube version'),
      null,
    );
  });
}
