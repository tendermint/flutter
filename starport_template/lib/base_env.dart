class BaseEnv {
  BaseEnv({
    this.envLcdUrl = 'http://10.0.2.2',
    this.envGrpcUrl = 'http://localhost',
    this.envLcdPort = '1317',
    this.envGrpcPort = '9090',
    this.prefixAddress = 'cosmos',
  });

  /// Configure the LCD Url
  final String envLcdUrl;

  /// Configure the GRPC Url
  final String envGrpcUrl;

  /// Configure the LCD Port
  final String envLcdPort;

  /// Configure the GRPC Port
  final String envGrpcPort;

  /// Configure the address prefix
  final String prefixAddress;

  /// Configure the base api url
  String get envBaseApiUrl => '$envLcdUrl:$envLcdPort';

  BaseEnv copyWith({
    String? envLcdUrl,
    String? envGrpcUrl,
    String? envLcdPort,
    String? envGrpcPort,
    String? prefixAddress,
  }) {
    return BaseEnv(
      envLcdUrl: envLcdUrl ?? this.envLcdUrl,
      envGrpcUrl: envGrpcUrl ?? this.envGrpcUrl,
      envLcdPort: envLcdPort ?? this.envLcdPort,
      envGrpcPort: envGrpcPort ?? this.envGrpcPort,
      prefixAddress: prefixAddress ?? this.prefixAddress,
    );
  }
}
