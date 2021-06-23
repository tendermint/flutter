class BalancesModel {
  late List<Balances> balances;
  late Pagination pagination;

  BalancesModel({required this.balances, required this.pagination});

  BalancesModel.fromJson(Map<String, dynamic> json) {
    balances = <Balances>[];
    if (json['balances'] != null) {
      if ((json['balances'] as List).isNotEmpty) {
        json['balances'].forEach((Map<String, dynamic> v) {
          balances.add(Balances.fromJson(v));
        });
      }
    }
    pagination = Pagination.fromJson(json['pagination'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['balances'] = balances.map((v) => v.toJson()).toList();
    data['pagination'] = pagination.toJson();
    return data;
  }
}

class Balances {
  late String denom;
  late String amount;

  Balances({required this.denom, required this.amount});

  Balances.fromJson(Map<String, dynamic> json) {
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

class Pagination {
  dynamic nextKey;
  late String total;

  Pagination({this.nextKey, required this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    nextKey = json['next_key'];
    total = json['total'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['next_key'] = nextKey;
    data['total'] = total;
    return data;
  }
}
