import 'package:flutter/material.dart';

class CustomCircleIndicator extends StatelessWidget {
  final Color? color;
  final double? size;

  const CustomCircleIndicator({
    super.key,
    this.color,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? Theme.of(context).primaryColor),
          semanticsLabel: 'Loading',
        ),
      ),
    );
  }
}
