import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProducts) {
          return Container(
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
                    borderRadius:
                        BorderRadius.circular(Dimensions.height10 * 2),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProducts.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.height10 * 0.5,
                      ),
                      BigText(text: popularProducts.inCartItem.toString()),
                      SizedBox(
                        width: Dimensions.height10 * 0.5,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProducts.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProducts.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.height10 * 2),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.height10 * 2),
                      color: AppColors.mainColor,
                    ),
                    child: BigText(
                      text: "\$${product.price!} | Add to cart",
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
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
                GestureDetector(
                  onTap: () {
                    if (page == "cartpage") {
                      Get.toNamed(RouteHelper.getCartPage());
                    } else {
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    isLeft: true,
                    size: Dimensions.height10 * 5,
                  ),
                ),
                GetBuilder<PopularProductController>(
                  builder: (popularProduct) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (popularProduct.totalItems >= 1) {
                              Get.toNamed(RouteHelper.getCartPage());
                            }
                          },
                          child: AppIcon(
                            icon: Icons.shopping_cart_outlined,
                            size: Dimensions.height10 * 5,
                          ),
                        ),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: Dimensions.height10 * 0.8,
                                top: Dimensions.height10 * 0.8,
                                child: Container(
                                  padding:
                                      EdgeInsets.all(Dimensions.height10 * 0.3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.mainColor,
                                  ),
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                    minWidth: Dimensions.height10 * 1.5,
                                    minHeight: Dimensions.height10 * 1.5,
                                  ),
                                  child: SmallText(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    color: Colors.white,
                                    size: Dimensions.height10 * 0.8,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    );
                  },
                ),
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
