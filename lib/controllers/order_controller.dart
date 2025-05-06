import 'package:food_delivery/data/repository/order_repo.dart';
import 'package:food_delivery/models/place_oreder_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> placeOrder(PlaceOrederModel placeOrder, Function callBack) async {
    _isLoading = true;
    // update();
    Response response = await orderRepo.placeOrder(placeOrder);
    if (response.statusCode == 200) {
      _isLoading = false;
      String message = response.body['message'];
      String orderId = response.body['order_id'].toString();
      callBack(true, message, orderId);
    } else {
      callBack(false, response.statusText, '-1');
    }
    // _isLoading = false;
    // update();
  }
}
