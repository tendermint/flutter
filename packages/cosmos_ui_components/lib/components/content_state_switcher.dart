import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class ContentStateSwitcher extends StatelessWidget {
  final bool isLoading;
  final bool isEmpty;
  final bool isError;
  final Widget loadingChild;
  final Widget emptyChild;
  final Widget contentChild;
  final Widget errorChild;

  const ContentStateSwitcher({
    Key? key,
    this.isLoading = false,
    this.isEmpty = false,
    this.isError = false,
    this.loadingChild = const ContentLoadingIndicator(),
    this.emptyChild = const SizedBox.shrink(),
    this.errorChild = const SizedBox.shrink(),
    required this.contentChild,
  }) : super(key: key);

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
}
