import 'package:flutter/material.dart';

/// Class responsible of handling navigation between pages, this should not be used directly,
/// but trough "*Navigator" classes instead
class AppNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();

  Future<R?> push<R>(BuildContext context, Route<R> route, {bool useRoot = false}) async {
    return _navigator(context, useRoot: useRoot).push(route);
  }

  void close(BuildContext context) => closeWithResult(context, null);

  void closeWithResult<T>(BuildContext context, T result) =>
      _navigator(context).canPop() ? _navigator(context).pop(result) : result;

  void popUntilRoot(BuildContext context) => _navigator(context).popUntil((route) => route.isFirst);
}

Route<T> fadeInRoute<T>(Widget page, {int? durationMillis}) => PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: durationMillis ?? 250),
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: page,
      ),
    );

Route<T> materialRoute<T>(Widget page, {bool fullScreenDialog = false}) => MaterialPageRoute(
      builder: (context) => page,
      fullscreenDialog: fullScreenDialog,
    );

Route<T> slideBottomRoute<T>(Widget page, {int? durationMillis, bool fullScreenDialog = false}) => PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: durationMillis ?? 250),
      fullscreenDialog: fullScreenDialog,
      pageBuilder: (context, animation, secondaryAnimation) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutQuint)),
        child: page,
      ),
    );

NavigatorState _navigator(BuildContext? context, {bool useRoot = false}) =>
    (useRoot || context == null) ? AppNavigator.navigatorKey.currentState! : Navigator.of(context);
