import 'package:flutter/material.dart';
import '../../../core/utils/contants.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 12
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: AppConstants.subtitleFontSize, fontWeight: FontWeight.bold),
        ),
      );
  }
}