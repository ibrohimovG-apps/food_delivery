import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height10,
            ),
            Container(
              height: Dimensions.height10 * 25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Dimensions.height10 * 8,
                  backgroundImage: AssetImage(
                    "assets/image/logo part 1.png",
                  ),
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: Dimensions.height10 * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: Dimensions.height10 * 6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: Dimensions.height10 * 2,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height10 * 2,
            ),
            AppTextField(
              text: "Phone",
              controller: phoneController,
              icon: Icons.phone,
              iconColor: AppColors.yellowColor,
            ),
            SizedBox(
              height: Dimensions.height10 * 2,
            ),
            AppTextField(
              text: "Password",
              controller: passwordController,
              icon: Icons.password_outlined,
              iconColor: AppColors.yellowColor,
              isObscure: true,
            ),
            SizedBox(
              height: Dimensions.height10 * 2,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "Sign into your account",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.height10 * 2,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions.height10 * 2,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height10 * 8,
            ),
            Container(
              width: Dimensions.height10 * 20,
              height: Dimensions.height10 * 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height10 * 3),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign In",
                  size: Dimensions.height10 * 3,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10 * 4,
            ),
            RichText(
              text: TextSpan(
                text: "Do not have an account?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.height10 * 2,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => SignUpPage());
                      },
                    text: " Create",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.height10 * 2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
