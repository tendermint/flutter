import 'dart:convert';

import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

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

extension AdditionalDataParsing on WalletPublicInfo {
  WalletAdditionalData get data =>
      WalletAdditionalData.fromJson(jsonDecode(additionalData ?? '{}') as Map<String, dynamic>);
}
