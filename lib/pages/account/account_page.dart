import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: "Profile",
          color: Colors.white,
          size: Dimensions.height10 * 2.5,
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height10 * 2),
        child: Column(
          children: [
            Container(
              width: Dimensions.height10 * 15,
              height: Dimensions.height10 * 15,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius:
                    BorderRadius.circular(Dimensions.height10 * 15 / 2),
              ),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: Dimensions.height10 * 7.5,
              ),
            ),
            SizedBox(
              height: Dimensions.height10 * 3,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(
                      icon: Icons.person,
                      text: "Ahmed",
                      backgroundColor: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    AccountWidget(
                      icon: Icons.phone,
                      text: "67867687678",
                      backgroundColor: AppColors.yellowColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    AccountWidget(
                      icon: Icons.email,
                      text: "example@gmail.com",
                      backgroundColor: AppColors.yellowColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    AccountWidget(
                      icon: Icons.location_on,
                      text: "Address",
                      backgroundColor: AppColors.yellowColor,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    AccountWidget(
                      icon: Icons.message_outlined,
                      text: "Messages",
                      backgroundColor: Colors.redAccent,
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userHasLoggedIn()) {
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getSignIn());
                        }
                      },
                      child: AccountWidget(
                        icon: Icons.logout,
                        text: "Log Out",
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10 * 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
