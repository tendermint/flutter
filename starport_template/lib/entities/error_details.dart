import 'package:equatable/equatable.dart';

class CosmosErrorDetails extends Equatable {
  const CosmosErrorDetails({
    required this.error,
    this.stackTrace,
  });

  factory CosmosErrorDetails.empty() => const CosmosErrorDetails(error: '');

  final dynamic error;
  final StackTrace? stackTrace;

  @override
  List<Object> get props => [
        error,
        stackTrace ?? '',
      ];

  @override
  String toString() => '''
  Error[ 
    error: $error,
    stackTrace: $stackTrace
  ]''';
}
