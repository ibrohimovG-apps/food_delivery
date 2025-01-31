import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
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
                    Get.toNamed(RouteHelper.getHome());
                  },
                  child: AppIcon(
                    icon: Icons.clear,
                  ),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height10 * 6,
              vertical: Dimensions.height10 * 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$${product.price!}  X  0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.height10 * 2.6,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
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
                Container(
                  padding: EdgeInsets.all(Dimensions.height10 * 2),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.height10 * 2),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
