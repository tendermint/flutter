class BalanceJson {
  BalanceJson({required this.denom, required this.amount});

  BalanceJson.fromJson(Map<String, dynamic> json) {
    denom = json['denom'] as String;
    amount = json['amount'] as String;
  }

  late String denom;
  late String amount;
}
