import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContentStateSwitcher extends StatelessWidget {
  const ContentStateSwitcher({
    required this.contentChild,
    this.isLoading = false,
    this.isEmpty = false,
    this.isError = false,
    this.loadingChild = const ContentLoadingIndicator(),
    this.emptyChild = const SizedBox.shrink(),
    this.errorChild = const SizedBox.shrink(),
    Key? key,
  }) : super(key: key);

  final bool isLoading;
  final bool isEmpty;
  final bool isError;
  final Widget loadingChild;
  final Widget emptyChild;
  final Widget contentChild;

  final Widget errorChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const MediumDuration(),
      child: isLoading
          ? loadingChild
          : isError
              ? errorChild
              : isEmpty
                  ? emptyChild
                  : contentChild,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isEmpty', isEmpty))
      ..add(DiagnosticsProperty<bool>('isLoading', isLoading))
      ..add(DiagnosticsProperty<bool>('isError', isError));
  }
}
