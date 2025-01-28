import 'package:flutter/material.dart';
import 'package:food_delivery/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height10 * 6,
                bottom: Dimensions.height10 * 1.5,
              ),
              padding: EdgeInsets.only(
                left: Dimensions.height10 * 2,
                right: Dimensions.height10 * 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Bangladesh",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Narsingdi",
                            color: Colors.black54,
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: Dimensions.height10 * 2.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height10 * 4.5,
                      height: Dimensions.height10 * 4.5,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.height10 * 1.5),
                        color: AppColors.mainColor,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimensions.height10 * 2.5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
