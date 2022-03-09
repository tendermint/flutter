enum SavePasswordFailureType {
  Unknown,
  StorageFailure,
}

class SavePasswordFailure {
  const SavePasswordFailure.unknown([this.cause, this.stack])
      : type = SavePasswordFailureType.Unknown;

  const SavePasswordFailure.storageFailure(this.cause, [this.stack])
      : type = SavePasswordFailureType.StorageFailure;

  final SavePasswordFailureType type;
  final dynamic cause;
  final dynamic stack;
}
