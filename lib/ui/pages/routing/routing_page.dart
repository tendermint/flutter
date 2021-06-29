import 'package:flutter/material.dart';
import 'package:flutter_app/dependency_injection/app_component.dart';
import 'package:flutter_app/presentation/routing/routing_presentation_model.dart';
import 'package:flutter_app/presentation/routing/routing_presenter.dart';
import 'package:flutter_app/ui/pages/routing/routing_navigator.dart';

class RoutingPage extends StatefulWidget {
  final RoutingPresenter? presenter;

  const RoutingPage({
    Key? key,
    this.presenter, // useful for tests
  }) : super(key: key);

  @override
  _RoutingPageState createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  late RoutingPresenter presenter;

  RoutingViewModel get model => presenter.viewModel;

  @override
  void initState() {
    super.initState();
    presenter = widget.presenter ??
        getIt(
          param1: RoutingPresentationModel(),
          param2: getIt<RoutingNavigator>(),
        );
    presenter.navigator.context = context;
    presenter.init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
