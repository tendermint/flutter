class Transaction {
  late String fromAddress;
  late String toAddress;
  late List<Amount> amount;

  Transaction({required this.fromAddress, required this.toAddress, required this.amount});

  Transaction.fromJson(Map<String, dynamic> json) {
    fromAddress = json['from_address'] as String;
    toAddress = json['to_address'] as String;
    amount = <Amount>[];
    if (json['amount'] != null) {
      amount = <Amount>[];
      json['amount'].forEach((Map<String, dynamic> v) {
        amount.add(Amount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['from_address'] = fromAddress;
    data['to_address'] = toAddress;
    data['amount'] = amount.map((v) => v.toJson()).toList();
    return data;
  }
}

class Amount {
  late String denom;
  late String amount;

  Amount({required this.denom, required this.amount});

  Amount.fromJson(Map<String, dynamic> json) {
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
