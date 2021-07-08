class CredentialsStorageFailure {
  final String message;

  const CredentialsStorageFailure(this.message);

  @override
  String toString() {
    return 'CredentialsStorageFailure{$message}';
  }
}
