class Transaction {
  late String fromAddress;
  late String toAddress;
  late List<Amount> amount;

  Transaction({required this.fromAddress, required this.toAddress, required this.amount});

  Transaction.fromJson(Map<String, dynamic> json) {
    fromAddress = json['from_address'];
    toAddress = json['to_address'];
    amount = <Amount>[];
    if (json['amount'] != null) {
      amount = <Amount>[];
      json['amount'].forEach((v) {
        amount.add(new Amount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_address'] = this.fromAddress;
    data['to_address'] = this.toAddress;
    if (this.amount != null) {
      data['amount'] = this.amount.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Amount {
  late String denom;
  late String amount;

  Amount({required this.denom, required this.amount});

  Amount.fromJson(Map<String, dynamic> json) {
    denom = json['denom'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['denom'] = this.denom;
    data['amount'] = this.amount;
    return data;
  }
}