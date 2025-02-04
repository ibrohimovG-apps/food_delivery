import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      't.png',
      'f.png',
      'g.png',
    ];
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
            AppTextField(
              text: "Email",
              controller: emailController,
              icon: Icons.email,
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
            ),
            SizedBox(
              height: Dimensions.height10 * 2,
            ),
            AppTextField(
              text: "Name",
              controller: nameController,
              icon: Icons.person,
              iconColor: AppColors.yellowColor,
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
            Container(
              width: Dimensions.height10 * 20,
              height: Dimensions.height10 * 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height10 * 3),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign Up",
                  size: Dimensions.height10 * 3,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    return Get.back();
                  },
                text: "Have an account already?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.height10 * 2,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10 * 10,
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    return Get.back();
                  },
                text: "Sign up using one of the following methods",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.height10 * 1.6,
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: Dimensions.height10,
              children: List.generate(
                3,
                (index) {
                  return Padding(
                    padding: EdgeInsets.all(Dimensions.height10),
                    child: CircleAvatar(
                      radius: Dimensions.height10 * 3,
                      backgroundImage: AssetImage(
                        "assets/image/${signUpImages[index]}",
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
