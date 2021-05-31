class BalancesModel {
  late List<Balances> balances;
  late Pagination pagination;

  BalancesModel({required this.balances, required this.pagination});

  BalancesModel.fromJson(Map<String, dynamic> json) {
    if (json['balances'] != null) {
      balances = <Balances>[];
      json['balances'].forEach((v) {
        balances.add(new Balances.fromJson(v));
      });
    }
    pagination = Pagination.fromJson(json['pagination']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.balances != null) {
      data['balances'] = this.balances.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    return data;
  }
}

class Balances {
  late String denom;
  late String amount;

  Balances({required this.denom, required this.amount});

  Balances.fromJson(Map<String, dynamic> json) {
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

class Pagination {
  Null nextKey;
  late String total;

  Pagination({this.nextKey, required this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    nextKey = json['next_key'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next_key'] = this.nextKey;
    data['total'] = this.total;
    return data;
  }
}