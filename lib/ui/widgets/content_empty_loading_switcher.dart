import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/content_loading_indicator.dart';
import 'package:flutter_app/utils/durations.dart';

class ContentLoadingEmptyViewSwitcher extends StatelessWidget {
  final bool isLoading;
  final bool isEmpty;
  final Widget loadingChild;
  final Widget emptyChild;
  final Widget contentChild;

  const ContentLoadingEmptyViewSwitcher({
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
