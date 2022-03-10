import 'package:alan/alan.dart';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class TransactionResponse extends Equatable {
  const TransactionResponse({
    required this.hash,
    required this.data,
    required this.logs,
    required this.rawLog,
    required this.gasUsed,
    required this.gasWanted,
    required this.timestamp,
  });

  factory TransactionResponse.fromTxResponse(TxResponse tx) {
    return TransactionResponse(
      hash: TransactionHash(hash: tx.txhash),
      data: tx.data,
      rawLog: tx.rawLog,
      logs: List<TransactionLog>.from(
        tx.logs.map(
          (log) => TransactionLog(
            log: log.log,
            msgIndex: log.msgIndex,
            events: List.from(
              log.events.map(
                (e) => e.toProto3Json(),
              ),
            ),
          ),
        ),
      ),
      gasUsed: Decimal.parse('${tx.gasUsed}'),
      gasWanted: Decimal.parse('${tx.gasWanted}'),
      timestamp: DateTime.fromMillisecondsSinceEpoch(int.parse(tx.timestamp)),
    );
  }

  final TransactionHash hash;
  final String data;
  final String rawLog;
  final List<TransactionLog> logs;
  final Decimal gasUsed;
  final Decimal gasWanted;
  final DateTime timestamp;

  @override
  List<Object> get props {
    return [
      hash,
      data,
      rawLog,
      logs,
      gasUsed,
      gasWanted,
      timestamp,
    ];
  }

  TransactionResponse copyWith({
    TransactionHash? hash,
    String? data,
    String? rawLog,
    List<TransactionLog>? logs,
    Decimal? gasUsed,
    Decimal? gasWanted,
    DateTime? timestamp,
  }) {
    return TransactionResponse(
      hash: hash ?? this.hash,
      data: data ?? this.data,
      rawLog: rawLog ?? this.rawLog,
      logs: logs ?? this.logs,
      gasUsed: gasUsed ?? this.gasUsed,
      gasWanted: gasWanted ?? this.gasWanted,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

class TransactionHash extends Equatable {
  const TransactionHash({required this.hash});

  final String hash;

  @override
  List<Object> get props {
    return [
      hash,
    ];
  }

  TransactionHash copyWith({
    String? hash,
  }) {
    return TransactionHash(
      hash: hash ?? this.hash,
    );
  }
}

class TransactionLog extends Equatable {
  const TransactionLog({
    required this.msgIndex,
    required this.log,
    this.events,
  });

  final int msgIndex;
  final String? log;
  final List<Object?>? events;

  @override
  List<Object> get props => [msgIndex, log ?? '', events ?? []];

  TransactionLog copyWith({
    int? msgIndex,
    String? log,
    List<Object?>? events,
  }) {
    return TransactionLog(
      msgIndex: msgIndex ?? this.msgIndex,
      log: log ?? this.log,
      events: events ?? this.events,
    );
  }
}
