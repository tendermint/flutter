abstract class TransactionBroadcastingFailure {}

class TransactionBroadcasterNotFoundFailure extends TransactionBroadcastingFailure {}

class StorageProblemBroadcastingFailure extends TransactionBroadcastingFailure {}
