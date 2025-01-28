import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;
  BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: size == 0 ? Dimensions.height10 * 2 : size,
        color: color,
      ),
    );
  }
}
