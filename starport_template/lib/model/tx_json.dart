class Tx {
  Tx({
    required this.type,
    required this.body,
  });

  String type;
  Body body;

  factory Tx.fromJson(Map<String, dynamic> json) => Tx(
        type: json["@type"] as String? ?? '',
        body: Body.fromJson(json["body"] as Map<String, dynamic>),
      );
}

class Body {
  Body({required this.messages});

  List<Message> messages;

  factory Body.fromJson(Map<String, dynamic> json) =>
      Body(messages: (json["messages"] as List).map((x) => Message.fromJson(x as Map<String, dynamic>)).toList());
}

class Message {
  Message({
    required this.type,
    required this.fromAddress,
    required this.toAddress,
    required this.amount,
  });

  String type;
  String fromAddress;
  String toAddress;
  List<Amount> amount;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        type: json["@type"] as String? ?? '',
        fromAddress: json["from_address"] as String? ?? '',
        toAddress: json["to_address"] as String? ?? '',
        amount: (json["amount"] as List).map((x) => Amount.fromJson(x as Map<String, dynamic>)).toList(),
      );
}

class Amount {
  Amount({
    required this.denom,
    required this.amount,
  });

  String denom;
  String amount;

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        denom: json["denom"] as String? ?? '',
        amount: json["amount"] as String? ?? '',
      );
}
