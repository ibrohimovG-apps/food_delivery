import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/order_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  final OrderModel orderModel;
  PaymentScreen({required this.orderModel});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController _controller;
  late String selectedUrl;
  bool _canRedirect = true;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    selectedUrl =
        '${AppConstants.BASE_URL}/payment-mobile?customer_id=${widget.orderModel.userId}&order_id=${widget.orderModel.id}';

    final PlatformWebViewControllerCreationParams params =
        const PlatformWebViewControllerCreationParams();
    _controller = WebViewController.fromPlatformCreationParams(params)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
          'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E233 Safari/601.1')
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('Page started loading: $url');
            setState(() => _isLoading = true);
            _redirect(url);
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
            setState(() => _isLoading = false);
            _redirect(url);
          },
        ),
      )
      ..loadRequest(Uri.parse(selectedUrl));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Payment"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => _exitApp(context),
          ),
          backgroundColor: AppColors.mainColor,
        ),
        body: Center(
          child: Container(
            width: Dimensions.screenWidth,
            child: Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _redirect(String url) {
    if (_canRedirect) {
      bool _isSuccess =
          url.contains('success') && url.contains(AppConstants.BASE_URL);
      bool _isFailed =
          url.contains('fail') && url.contains(AppConstants.BASE_URL);
      bool _isCancel =
          url.contains('cancel') && url.contains(AppConstants.BASE_URL);

      if (_isSuccess || _isFailed || _isCancel) {
        _canRedirect = false;
      }

      if (_isSuccess) {
        Get.offNamed(RouteHelper.getOrderSuccessRoute(
            widget.orderModel.id.toString(), 'success'));
      } else if (_isFailed || _isCancel) {
        Get.offNamed(RouteHelper.getOrderSuccessRoute(
            widget.orderModel.id.toString(), 'fail'));
      }
    }
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false;
    } else {
      print("app exited");
      return true;
    }
  }
}
