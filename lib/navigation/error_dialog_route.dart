import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/domain/model/failures/displayable_failure.dart';

abstract class ErrorDialogRoute<T> {
  BuildContext get context;

  Future<void> showError(DisplayableFailure failure) => showDialog(
        context: context,
        builder: (context) => ErrorDialog(failure: failure),
      );

  factory ErrorDialogRoute._() => throw UnsupportedError("This class is meant to be mixed in");
}

class ErrorDialog extends StatelessWidget {
  final DisplayableFailure failure;

  const ErrorDialog({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(failure.title),
      content: Text(failure.message),
    );
  }
}
