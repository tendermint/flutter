# transaction_signing_gateway

Transaction Signing gateway library encapsulates logic for securely storing wallet credentials as well as allows for specifying a sandboxed environment for transaction signing. This library was created with extendability in mind, so that you can pass in your own implementation of signing transactions and serializing/deserializing wallet credentials if you wish to support your own, propiertiary chain implementations.

## Getting Started

An access point is the `TransactionSigningGateway` class, which you have to initialize first with the implementations of various dependent classes., for example:
```dart
final signingGateway = TransactionSigningGateway(
      transactionSummaryUI: MobileTransactionSummaryUI(),
      infoStorage: MobileKeyInfoStorage(serializers: [
          SaccoCredentialsSerializer(),
      ]),
      signers: [
        SaccoTransactionSigner(),
      ],
    );
```