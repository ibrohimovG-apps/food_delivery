import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final bool? isLeft;

  AppIcon({
    super.key,
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size = 40,
    this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Padding(
        padding: isLeft == true
            ? const EdgeInsets.only(left: 5.0)
            : const EdgeInsets.only(left: 0),
        child: Icon(
          icon,
          color: iconColor,
          size: Dimensions.height10 * 2,
        ),
      ),
    );
  }
}
