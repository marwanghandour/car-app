import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  final String tabTitle;

  const TabContent({super.key, required this.tabTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        tabTitle,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}