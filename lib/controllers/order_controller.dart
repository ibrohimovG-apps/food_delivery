import 'package:food_delivery/data/repository/order_repo.dart';
import 'package:food_delivery/models/order_model.dart';
import 'package:food_delivery/models/place_oreder_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});

  late List<OrderModel> _currentOrderList;
  late List<OrderModel> _historyOrderList;

  List<OrderModel> get currentOrderList => _currentOrderList;
  List<OrderModel> get historyOrderList => _historyOrderList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> placeOrder(
      PlaceOrederModel placeOrder, Function callBack) async {
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

  Future<void> getOrderList() async {
    _isLoading = true;
    Response response = await orderRepo.getOrderList();
    if (response.statusCode == 200) {
      _historyOrderList = [];
      _currentOrderList = [];
      response.body.forEach((order) {
        OrderModel orderModel = OrderModel.fromJson(order);
        if (orderModel.orderStatus == 'pending' ||
            orderModel.orderStatus == 'accepted' ||
            orderModel.orderStatus == 'processing' ||
            orderModel.orderStatus == 'handover' ||
            orderModel.orderStatus == 'picked_up') {
          _currentOrderList.add(orderModel);
        } else {
          _historyOrderList.add(orderModel);
        }
      });
    } else {
      _historyOrderList = [];
      _currentOrderList = [];
      _isLoading = false;
      update();
    }
  }
}
