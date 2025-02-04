import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  const AccountWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.height10 * 2,
        vertical: Dimensions.height10 * 1.5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: Row(
        children: [
          AppIcon(
            icon: icon,
            iconColor: Colors.white,
            backgroundColor: backgroundColor,
            size: Dimensions.height10 * 5,
          ),
          SizedBox(
            width: Dimensions.height10 * 2,
          ),
          BigText(
            text: text,
          ),
        ],
      ),
    );
  }
}
