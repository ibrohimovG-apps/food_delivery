import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_button.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class OrderSuccessPage extends StatelessWidget {
  final String orderId;
  final int status;
  const OrderSuccessPage(
      {super.key, required this.orderId, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      Future.delayed(const Duration(seconds: 1), () {
        //
      });
    }
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(status == 1
                  ? "assets/image/checked.png"
                  : "assets/image/warning.png"),
              SizedBox(
                height: Dimensions.height10 * 4.5,
              ),
              Text(
                status == 1 ? "Ordered Successfully" : "Failed",
                style: TextStyle(
                  fontSize: Dimensions.height10*2.6,
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 2,
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.height10*2),
                child: Text(
                  status == 1 ? "Successfull Order" : "Failed Order",
                  style: TextStyle(
                    fontSize: Dimensions.height10 * 2,
                    color: Theme.of(context).disabledColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: Dimensions.height10 * 3,
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.height10*2),
                child: CustomButton(
                  buttonText: "Back to home",
                  onPressed: ()=>Get.offAllNamed(RouteHelper.getInitial()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
