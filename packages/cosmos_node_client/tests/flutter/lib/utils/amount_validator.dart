double validateAmount(String value) {
  if (value.isEmpty) {
    return 0;
  }
  final _amount = double.tryParse(value);
  if (_amount == null) {
    return 0;
  } else {
    return _amount;
  }
}
