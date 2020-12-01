import 'package:flutter/material.dart';
import 'package:netsells_test/presentation/widgets/loading_indicator/common_circular_loading_indicator.dart';

class CommonScaffold extends StatelessWidget {
  final bool isLoading;
  final Widget body;

  const CommonScaffold({
    Key key,
    @required this.isLoading,
    @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (isLoading) CommonCircularLoadingIndicator(),
          body,
        ],
      ),
    );
  }
}
