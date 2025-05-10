import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/order_controller.dart';
import 'package:food_delivery/models/order_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class ViewOrder extends StatelessWidget {
  final bool isCurrent;
  const ViewOrder({super.key, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderController>(builder: (orderController) {
        if (orderController.isLoading) {
          late List<OrderModel> orderList;
          if (orderController.currentOrderList.isNotEmpty) {
            orderList = isCurrent
                ? orderController.currentOrderList.reversed.toList()
                : orderController.historyOrderList.reversed.toList();
          }
          return SizedBox(
            width: Dimensions.screenWidth,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.height10 * 0.5),
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => null,
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("#order ID ${orderList[index].id}"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.height10 * 0.5),
                                      color: AppColors.mainColor,
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.all(
                                          Dimensions.height10 * 0.5),
                                      child: Text(
                                        "${orderList[index].orderStatus}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height10 * 0.5,
                                  ),
                                  InkWell(
                                    onTap: () => null,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.height10 * 0.5),
                                          // color: AppColors.mainColor,
                                          border: Border.all(
                                            width: 1,
                                            color: AppColors.mainColor,
                                          )),
                                      child: Container(
                                        margin: EdgeInsets.all(
                                            Dimensions.height10 * 0.5),
                                        child: Text(
                                          "Track order",
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Text("data");
      }),
    );
  }
}
