import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/sign_up_body_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });
  Future<Response> registration(SignUpBodyModel signUpBodyModel) async {
    return await apiClient.postData(
      AppConstants.REGISTRATION_URL,
      signUpBodyModel.toJson(),
    );
  }

  saveUserToke(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
