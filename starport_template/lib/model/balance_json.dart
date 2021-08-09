class BalanceJson {
  late String denom;
  late String amount;

  BalanceJson({required this.denom, required this.amount});

  BalanceJson.fromJson(Map<String, dynamic> json) {
    denom = json['denom'] as String;
    amount = json['amount'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['denom'] = denom;
    data['amount'] = amount;
    return data;
  }
}
