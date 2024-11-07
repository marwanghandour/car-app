import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  const IconContainer({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        shape: BoxShape.circle,
      
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
