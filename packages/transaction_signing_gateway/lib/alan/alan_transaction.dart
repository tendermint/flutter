import 'package:alan/alan.dart';
import 'package:equatable/equatable.dart';
import 'package:protobuf/protobuf.dart';
import 'package:transaction_signing_gateway/model/signed_transaction.dart';
import 'package:transaction_signing_gateway/model/unsigned_transaction.dart';

class UnsignedAlanTransaction extends Equatable implements UnsignedTransaction {
  final List<GeneratedMessage> messages;
  final String memo;
  final Fee? fee;

  const UnsignedAlanTransaction({
    required this.messages,
    this.memo = "",
    this.fee,
  });

  @override
  List<Object?> get props => [
        messages,
        memo,
        fee,
      ];
}

class SignedAlanTransaction extends Equatable implements SignedTransaction {
  final Tx signedTransaction;

  const SignedAlanTransaction({required this.signedTransaction});

  @override
  List<Object?> get props => [signedTransaction];
}
