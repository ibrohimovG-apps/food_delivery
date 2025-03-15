import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
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
    bool _userLoggedIn = Get.find<AuthController>().userHasLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: "Profile",
          color: Colors.white,
          size: Dimensions.height10 * 2.5,
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(
        builder: (_userController) {
          return _userLoggedIn
              ? (_userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height10 * 2),
                      child: Column(
                        children: [
                          Container(
                            width: Dimensions.height10 * 15,
                            height: Dimensions.height10 * 15,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.height10 * 15 / 2),
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
                                    text: _userController.userModel?.name ?? '',
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10 * 2,
                                  ),
                                  AccountWidget(
                                    icon: Icons.phone,
                                    text:
                                        _userController.userModel?.phone ?? '',
                                    backgroundColor: AppColors.yellowColor,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10 * 2,
                                  ),
                                  AccountWidget(
                                    icon: Icons.email,
                                    text:
                                        _userController.userModel?.email ?? '',
                                    backgroundColor: AppColors.yellowColor,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10 * 2,
                                  ),
                                  GetBuilder<LocationController>(
                                    builder: (locationController) {
                                      if (_userLoggedIn &&
                                          locationController
                                              .addressList.isEmpty) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.offNamed(RouteHelper
                                                .getAddAddressPage());
                                          },
                                          child: AccountWidget(
                                            icon: Icons.location_on,
                                            text: "Fill Your Address",
                                            backgroundColor:
                                                AppColors.yellowColor,
                                          ),
                                        );
                                      } else {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.offNamed(RouteHelper
                                                .getAddAddressPage());
                                          },
                                          child: AccountWidget(
                                            icon: Icons.location_on,
                                            text: "Your Address",
                                            backgroundColor:
                                                AppColors.yellowColor,
                                          ),
                                        );
                                      }
                                    },
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
                                      if (Get.find<AuthController>()
                                          .userHasLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearSharedData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.find<LocationController>()
                                            .clearAddressList();
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
                    )
                  : CustomLoader())
              : Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height10 * 23,
                          margin: EdgeInsets.all(Dimensions.height10 * 2),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.height10 * 2),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/image/signintocontinue.png",
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignIn());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height10 * 10,
                            margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.height10 * 2),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.height10 * 2),
                            ),
                            child: Center(
                              child: BigText(
                                text: "Sign In",
                                color: Colors.white,
                                size: Dimensions.height10 * 3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
