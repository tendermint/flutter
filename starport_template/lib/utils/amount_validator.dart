double validateAmount(String value) {
  if (value.isEmpty) {
    return 0.0;
  }
  final _amount = double.tryParse(value);
  if (_amount != null) {
    return _amount;
  } else {
    return 0.0;
  }
}
