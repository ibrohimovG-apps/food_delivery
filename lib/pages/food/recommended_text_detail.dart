import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedTextDetail extends StatelessWidget {
  const RecommendedTextDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // toolbarHeight: Dimensions.height10 * 8,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
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
                    text: "Chinese Side",
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
              background: Image.asset(
                "assets/image/food0.png",
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
                      text:
                          "Cilantro, then par boiled lightly spiced riceChicken magnated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightlycilantro, then par boiled lightly spiced riceChicken magnated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightlycilantro, then par boiled lightly spiced riceChicken magnated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightlycilantro, then par boiled lightly spiced riceChicken magnated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightlycilantro, then par boiled lightly spiced riceChicken magnated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightlycilantro, then par boiled lightly spiced riceChicken magnated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced rice Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly spiced riceChicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilantro, then par boiled lightly"),
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
                  text: "\$12.88 " + " X " + " 0",
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
