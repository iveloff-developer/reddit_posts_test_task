import 'package:flutter/material.dart';
import 'package:netsells_test/presentation/widgets/loading_indicator/common_circular_loading_indicator.dart';

class CommonScaffold extends StatelessWidget {
  final bool isLoading;
  final PreferredSizeWidget appBar;
  final Widget drawer;
  final Widget body;

  const CommonScaffold({
    Key key,
    this.isLoading = false,
    this.appBar,
    this.drawer,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar,
        drawer: drawer,
        body: Stack(
          children: [
            if (isLoading) CommonCircularLoadingIndicator(),
            body,
          ],
        ),
      ),
    );
  }
}
