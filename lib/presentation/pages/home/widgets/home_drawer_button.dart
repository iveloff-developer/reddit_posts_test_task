import 'package:flutter/material.dart';

class HomeDrawerButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const HomeDrawerButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        child: Text(title),
        onPressed: onPressed,
      ),
    );
  }
}
