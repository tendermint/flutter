import 'package:equatable/equatable.dart';

class NetworkInfo extends Equatable {
  final String bech32Hrp;
  final String host;
  final String grpcUrl;
  final String grpcPort;
  final String lcdUrl;
  final String lcdPort;

  const NetworkInfo({
    required this.host,
    required this.bech32Hrp,
    required this.lcdUrl,
    required this.grpcUrl,
    required this.grpcPort,
    required this.lcdPort,
  });

  @override
  List<Object?> get props => [bech32Hrp, host, grpcPort, grpcUrl, lcdUrl, lcdPort];
}
