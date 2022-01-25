## Setup and run Flutter app

- [Setup Flutter based on your operating system](https://flutter.dev/docs/get-started/install)
- Make sure you follow all the steps above and have an all-green output of `flutter doctor` command.
- [Install and run Anroid Studio once](https://developer.android.com/studio/install)
- (For iOS) Install XCode from AppStore
- You can use Android Studio, [IntelliJ Idea](https://www.jetbrains.com/idea/download),
  or [VSCode](https://code.visualstudio.com/download) for Flutter development
- Install Flutter plugin in your chosen IDE
- Clone this repository using `git clone https://github.com/tendermint/flutter.git`
- To run it on your `localhost` environment, you will just have to run `main.dart` file in your project. That can be
  done directly by clicking on the play button in your IDE, or by running `flutter run` from the root of your project.
  This will run the app on any device or simulator connected to your system
- If you're running the app on real device instead of emulator/simulator or want to taget a specific blockchain run on a
  remote machine, make sure to specify proper urls and ports when running the app. Here is an example for running the
  app on cosmos hub testnet:

```
flutter run --dart-define=LCD_URL=https://api.testnet.cosmos.network --dart-define=LCD_PORT=443 --dart-define=GRPC_URL=https://grpc.testnet.cosmos.network --dart-define=GRPC_PORT=443
```

## Using template from Starport's scaffolded chain

- Clone the [Starport](https://github.com/tendermint/starport) repository from `develop` branch
- Make sure to install [GoLang](https://go.dev/dl/) for your platform
- Run `make install` in Starport's root directory
- Run `starport scaffold chain github.com/cosmonaut/mars` to create a new chain
- Run `cd mars`
- Run `starport scaffold flutter` to create a new Flutter app (this clones the `starport_template` repository - the
  current repo) and puts in under `flutter` subdirectory
- Run `starport generate dart` to generate dart files from proto files to be used by the template to interact with the
  blockchain