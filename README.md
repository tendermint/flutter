# Flutter application for integrating with Cosmos-SDK

This is a sample application which is integrated to Cosmos-SDK for adding wallets through mnemonnics and sending tokens to different addresses.

## Setup (Localhost)

- [Setup Flutter](https://flutter.dev/docs/get-started/install)
- [Install Starport](https://docs.starport.network/intro/install.html)
- Scaffold a blockchain using `starport app github.com/hello/planet`
- Navigate to `planet` folder and run `starport serve`
- After it is successfully built, you will see two mnenomics for Alice and Bob along with their wallet addresses in the terminal
- Run your Flutter app without any extra command line arguments and add both wallets in your app using the mnemonics from the terminal

## Setup (Hosted Testnet)
- [Setup Flutter](https://flutter.dev/docs/get-started/install)
- Run your Flutter app using `--dart-define=BASE_LCD_URL=api.testnet.cosmos.network --dart-define=PORT=443` as command line arguments
