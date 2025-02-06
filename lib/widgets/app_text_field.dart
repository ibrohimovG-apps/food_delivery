import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;
  final Color iconColor;
  final bool isObscure;
  const AppTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.icon,
    required this.iconColor,
    this.isObscure=false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height10 * 6,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.height10 * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.height10 * 1.5),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(1, 1),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
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
            borderRadius: BorderRadius.circular(Dimensions.height10 * 1.5),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height10 * 1.5),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height10 * 1.5),
          ),
        ),
      ),
    );
  }
}
