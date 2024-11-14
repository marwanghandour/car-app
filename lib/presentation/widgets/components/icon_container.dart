import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;
  final Color borderColor; 
  final double borderWidth;

  const IconContainer({
    super.key,
    required this.icon,
    this.onPressed,
    this.borderColor = Colors.grey,  
    this.borderWidth = 1.0,         
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(            
          color: borderColor,          
          width: borderWidth,      
        ),
      ),
      child: IconButton(
        icon: icon,
        color: Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}
