import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetail(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            // toolbarHeight: Dimensions.height10 * 8,
            title: Row(
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
                    icon: Icons.clear,
                    size: Dimensions.height10 * 5,
                  ),
                ),
                // AppIcon(icon: Icons.shopping_cart_outlined),
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height10 * 4),
              child: Container(
                padding:
                    EdgeInsets.symmetric(vertical: Dimensions.height10 * 0.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.height10 * 2),
                    topRight: Radius.circular(Dimensions.height10 * 2),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: BigText(
                    text: product.name!,
                    size: Dimensions.height10 * 2.6,
                  ),
                ),
                width: double.maxFinite,
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: Dimensions.height10 * 30,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOADS + product.img!,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: Dimensions.height10 * 2),
                  child: ExpandableTextWidget(
                    text: product.description!,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height10 * 8,
                  vertical: Dimensions.height10 * 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                    BigText(
                      text:
                          "\$${product.price!}  X  ${popularProduct.inCartItem}",
                      color: AppColors.mainBlackColor,
                      size: Dimensions.height10 * 2.6,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        size: Dimensions.height10 * 5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                        size: Dimensions.height10 * 3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.addItem(product);
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
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
