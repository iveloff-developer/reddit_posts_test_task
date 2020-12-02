import 'package:flutter/material.dart';

class RefreshableListView extends StatelessWidget {
  final RefreshCallback onRefresh;
  final List<Widget> children;

  const RefreshableListView({
    Key key,
    @required this.onRefresh,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(children: children),
    );
  }
}
