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

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

  bool userHasLoggedIn() {
    return  sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<Response> login(String phone, String password) async {
    return await apiClient.postData(
      AppConstants.LOGIN_URL,
      {"phone": phone, "password": password},
    );
  } 

  Future<bool> saveUserToke(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserEmailAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }
}
