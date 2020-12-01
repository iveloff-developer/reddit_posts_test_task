import 'package:flutter/material.dart';

class CommonCircularLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
