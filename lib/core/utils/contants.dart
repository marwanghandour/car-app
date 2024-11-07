import 'package:flutter/material.dart';

class AppConstants {
  // Padding constants
  static const EdgeInsets defaultPadding = EdgeInsets.all(16.0);
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0);
  static const EdgeInsets cardPadding = EdgeInsets.all(12.0);

  // SizedBox constants for spacing
  static const SizedBox verticalSpacingSmall = SizedBox(height: 8.0);
  static const SizedBox verticalSpacingMedium = SizedBox(height: 16.0);
  static const SizedBox verticalSpacingLarge = SizedBox(height: 32.0);

  static const SizedBox horizontalSpacingSmall = SizedBox(width: 8.0);
  static const SizedBox horizontalSpacingMedium = SizedBox(width: 16.0);
  static const SizedBox horizontalSpacingLarge = SizedBox(width: 32.0);

  // Border radius constants
  static const BorderRadius defaultBorderRadius = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius cardBorderRadius = BorderRadius.all(Radius.circular(8.0));

  // Font size constants (optional)
  static const double titleFontSize = 28.0;
  static const double subtitleFontSize = 18.0;
  static const double bodyFontSize = 14.0;
  

}
