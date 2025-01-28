import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({
    super.key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 0,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size == 0 ? Dimensions.height10 * 1.35 : size,
        color: color,
        height: height,
      ),
    );
  }
}
