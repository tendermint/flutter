import 'dart:convert';

import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class WalletAdditionalData {
  WalletAdditionalData({
    required this.isBackedUp,
  });

  factory WalletAdditionalData.fromJson(Map<String, dynamic> map) {
    return WalletAdditionalData(
      isBackedUp: map['isBackedUp'] as bool? ?? false,
    );
  }

  final bool isBackedUp;

  Map<String, dynamic> toJson() {
    return {
      'isBackedUp': isBackedUp,
    };
  }

  String toJsonString() => jsonEncode(toJson());
}

extension AdditionalDataParsing on WalletPublicInfo {
  WalletAdditionalData get data =>
      WalletAdditionalData.fromJson(jsonDecode(additionalData ?? '{}') as Map<String, dynamic>);
}
