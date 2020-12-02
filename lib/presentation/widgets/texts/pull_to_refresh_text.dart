import 'package:flutter/material.dart';

class PullToRefreshText extends StatelessWidget {
  final String errorMessage;
  final EdgeInsets padding;

  const PullToRefreshText({
    Key key,
    @required this.errorMessage,
    this.padding: const EdgeInsets.only(top: 50),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        '$errorMessage\nPull to refresh',
        textAlign: TextAlign.center,
      ),
    );
  }
}
