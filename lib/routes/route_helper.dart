import 'package:food_delivery/models/order_model.dart';
import 'package:food_delivery/pages/address/add_address_page.dart';
import 'package:food_delivery/pages/address/pick_address_map.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/payment/order_success_page.dart';
import 'package:food_delivery/pages/payment/payment_page.dart';
import 'package:food_delivery/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashScreen = '/splash-screen';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign-in';

  static const String addAddress = '/add-address';
  static const String pickAddressMap = '/pick-address';

  static const String payment = '/payment';
  static const String orderSuccess = '/order-successful';

  static String getSplashScrren() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSignIn() => '$signIn';

  static String getAddAddressPage() => '$addAddress';
  static String getPickAddressMap() => '$pickAddressMap';

  static String getPaymentPage(String id, int userid) => '$payment?id=$id&userId=$userid';
  static String getOrderSuccessRoute(String orderId, String status) => '$orderSuccess?id=$orderId&status=$status';

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: signIn,
      page: () => SignInPage(),
    ),
    GetPage(
      name: initial,
      page: () => HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: addAddress,
      page: () {
        return AddAddressPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: pickAddressMap,
      page: () {
        PickAddressMap _pickAddress = Get.arguments;
        return _pickAddress;
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: payment,
      page: () {
        return PaymentScreen(
          orderModel: OrderModel(
            id: int.parse(Get.parameters['id']!), 
            userId: int.parse(Get.parameters['userId']!),
          ),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: orderSuccess,
      page: () {
        return OrderSuccessPage(
          orderId: Get.parameters['id']!,
          status: Get.parameters['status'].toString().contains("success")?1:0,
        );
      },
      transition: Transition.fadeIn,
    ),
  ];
}
