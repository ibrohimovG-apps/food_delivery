import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Dimensions.height10 * 10,
        height: Dimensions.height10 * 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.height10 * 5),
            color: AppColors.mainColor),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
