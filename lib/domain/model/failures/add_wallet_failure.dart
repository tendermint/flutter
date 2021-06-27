import 'package:flutter_app/domain/model/failures/displayable_failure.dart';

enum _AddWalletFailureType {
  Unknown,
}

class AddWalletFailure {
  final _AddWalletFailureType _type;

  // ignore: avoid_field_initializers_in_const_classes
  const AddWalletFailure.unknown() : _type = _AddWalletFailureType.Unknown;

  DisplayableFailure displayableFailure() {
    switch (_type) {
      case _AddWalletFailureType.Unknown:
        return DisplayableFailure.commonError();
    }
  }
}
