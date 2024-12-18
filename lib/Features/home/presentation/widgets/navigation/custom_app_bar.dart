import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? logoUrl; 
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.logoUrl,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      title: Row(
        children: [
          if (logoUrl != null) 
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset( 
                AppStrings.appLogo,
                height: 55, 
              ),
            ),
        
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
