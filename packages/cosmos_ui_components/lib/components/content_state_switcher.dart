import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class ContentStateSwitcher extends StatelessWidget {
  final bool isLoading;
  final bool isEmpty;
  final Widget loadingChild;
  final Widget emptyChild;
  final Widget contentChild;

  const ContentStateSwitcher({
    Key? key,
    this.isLoading = false,
    this.isEmpty = false,
    this.loadingChild = const ContentLoadingIndicator(),
    this.emptyChild = const SizedBox.shrink(),
    required this.contentChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const MediumDuration(),
      child: isLoading
          ? loadingChild
          : isEmpty
              ? emptyChild
              : contentChild,
    );
  }
}
