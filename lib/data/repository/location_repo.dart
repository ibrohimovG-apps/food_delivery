import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAddressFromGeocode(LatLng latLng) async {
    return await apiClient.getData('${AppConstants.GEOCODE_URL}'
        '?lat=${latLng.latitude}&lng=${latLng.longitude}' // = belgisini qo‘shdik
        );
  }

  String getUserAddress() {
    return sharedPreferences.getString(AppConstants.USER_ADDRESS)??"";
  }
}
