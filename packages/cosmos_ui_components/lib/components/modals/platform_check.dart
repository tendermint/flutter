import 'dart:io';

enum OS {
  iOS,
  Android,
  Other,
}

typedef OSProvider = OS Function();

OS defaultOSProvider() => Platform.isIOS
    ? OS.iOS
    : Platform.isAndroid
        ? OS.Android
        : OS.Other;
