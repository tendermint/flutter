import 'dart:convert';

class WalletAdditionalData {
  final bool isBackedUp;

  WalletAdditionalData({
    required this.isBackedUp,
  });

  Map<String, dynamic> toJson() {
    return {
      'isBackedUp': isBackedUp,
    };
  }

  factory WalletAdditionalData.fromJson(Map<String, dynamic> map) {
    return WalletAdditionalData(
      isBackedUp: map['isBackedUp'] as bool? ?? false,
    );
  }

  String toJsonString() => jsonEncode(toJson());
}
