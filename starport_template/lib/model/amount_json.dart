class AmountJson {
  AmountJson({
    required this.denom,
    required this.amount,
  });

  String denom;
  String amount;

  factory AmountJson.fromJson(Map<String, dynamic> json) => AmountJson(
        denom: json["denom"] as String? ?? '',
        amount: json["amount"] as String? ?? '',
      );
}
