import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: Dimensions.height10 * 12,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height10 * 2,
          horizontal: Dimensions.height10 * 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height10 * 4),
            topRight: Radius.circular(Dimensions.height10 * 4),
          ),
          color: AppColors.buttonBackgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height10 * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height10 * 2),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.height10 * 0.5,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimensions.height10 * 0.5,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.height10 * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height10 * 2),
                color: AppColors.mainColor,
              ),
              child: BigText(
                text: "\$${product.price!} | Add to cart",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 35 * Dimensions.height10,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOADS +
                      product.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height10 * 6,
            left: Dimensions.height10 * 2,
            right: Dimensions.height10 * 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios, isLeft: true),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height10 * 33,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.height10 * 2,
                right: Dimensions.height10 * 2,
                top: Dimensions.height10 * 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.height10 * 2),
                  topRight: Radius.circular(Dimensions.height10 * 2),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(
                    height: Dimensions.height10 * 2,
                  ),
                  BigText(text: "Introduce"),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: product.description!,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
