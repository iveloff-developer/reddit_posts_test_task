import 'package:flutter/material.dart';
import 'package:netsells_test/presentation/widgets/loading_indicator/common_circular_loading_indicator.dart';

class CommonScaffold extends StatelessWidget {
  final bool isLoading;
  final AppBar appBar;
  final Widget body;

  const CommonScaffold({
    Key key,
    this.isLoading = false,
    this.appBar,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar,
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
