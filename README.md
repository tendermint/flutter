# Flutter app for integrating with Cosmos SDK

This is a sample application for Ethereum based blockchain and Cosmos SDK blockchain which supports basic wallet management (importing mnemonics), and sending tokens.

## Setup Starport (on `localhost`)

- [Install Starport](https://docs.starport.network/intro/install.html)
- Scaffold a blockchain using `starport app github.com/hello/planet`
- Navigate to `planet` folder and run `starport serve`
- After it is successfully built, you will see two mnemonics for Alice and Bob along with their wallet addresses in the terminal

## Setup Ethereum using Ganache (on `localhost`)

- [Install Ganache](https://www.trufflesuite.com/ganache)
- Launch Ganache and run Ethereum environment using Quick Start
- This will launch a local Ethereum network on your system

## Setup (Ethereum Testnet using Ropsten and Infura)
- The application connects to the project created in [Infura](https://infura.io/) Dashboard using Ropsten environment
- You can create your own project and pick up your project ID to be passed as `path` parameter in Flutter runtime arguments
- Currently, a sample project ID is already connected to the app (BASE_ETH_URL)

## Setup (Cosmos Hub Testnet)
- The Cosmos Hub Testnet uses publicly hosted links which will be passed as arguments while running the Flutter app

## Setup and run Flutter app
- [Setup Flutter based on your operating system](https://flutter.dev/docs/get-started/install)
- Make sure you follow all the steps above and have an all-green output of `flutter doctor` command.
- [Install and run Anroid Studio once](https://developer.android.com/studio/install)
- (For mac) Install XCode from AppStore
- You can use Android Studio, [IntelliJ Idea](https://www.jetbrains.com/idea/download/download-thanks.html?platform=mac&code=IIC), or [VSCode](https://code.visualstudio.com/download) for Flutter development
- Install Flutter plugin in your chosen IDE
- Clone this repository using `git clone https://github.com/tendermint/flutter.git`
- To run it on your `localhost` environment, you will just have to run `main.dart` file in your project. That can be done directly by clicking on the play button in your IDE, or by running `flutter run` from the root of your project. This will run the app on any device or simulator connected to your system. 
- To run it on the Cosmos Hub Testnet, run `flutter run --dart-define=BASE_LCD_URL=api.testnet.cosmos.network --dart-define=PORT=443 --dart-define=BASE_ETH_URL=https://ropsten.infura.io/v3/96ac5dcb92d545b6a7ffc3d8af21fde0`, or add additional arguments `--dart-define=BASE_LCD_URL=api.testnet.cosmos.network --dart-define=PORT=443 --dart-define=BASE_ETH_URL=https://ropsten.infura.io/v3/96ac5dcb92d545b6a7ffc3d8af21fde0` inside your IDE's configuration for `main.dart` and click on play button.
