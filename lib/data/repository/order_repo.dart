import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/place_oreder_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  OrderRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> placeOrder(PlaceOrederModel placeOrder) async {
    return await apiClient.postData(AppConstants.PLACE_ORDER_URL, placeOrder.toJson());
  }

  Future<Response> getOrderList() async {
    return await apiClient.getData(AppConstants.ORDER_LIST_URL);
  }
}