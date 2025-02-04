import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;
  final Color iconColor;
  const AppTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 6,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height10 * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.height10 * 3),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset(1, 10),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: Dimensions.height10 * 2),
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: Dimensions.height10 * 1.6,
          ),
          prefixIcon: Icon(
            icon,
            color: iconColor,
            size: Dimensions.height10 * 2.5,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height10 * 3),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height10 * 3),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height10 * 3),
          ),
        ),
      ),
    );
  }
}
