class AppConstants {
  static const String APP_NAME = "DBFood";
  static const int APP_VERSION = 1;

  // static const String BASE_URL = "https://mvs.bslmeiyu.com";

  static const String BASE_URL = "http://127.0.0.1:8000";
  static const String UPLOADS = "/uploads/";
  static const String POPULAR_PRODUCT_URL = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URL = "/api/v1/products/recommended";

  static const String REGISTRATION_URL = "/api/v1/auth/register";
  static const String LOGIN_URL = "/api/v1/auth/login";
  static const String USER_INFO = "/api/v1/customer/info";

  static const String TOKEN = "";
  static const String PHONE = "";
  static const String PASSWORD = "";

  static const String CART_LIST = "Cart-list";
  static const String CART_HISTORY_LIST = "Cart-history-list";

  static const String USER_ADDRESS = "user-address";
  static const String GEOCODE_URL = "/api/v1/config/geocode-api";
  static const String ADD_USER_ADDRESS = "/api/v1/customer/address/add";
  static const String ADDRESS_LIST_URL = "/api/v1/customer/address/list";
  static const String ZONE_URL = "/api/v1/config/get-zone-id";
  static const String SEARCH_LOCATION_URL =
      "/api/v1/config/place-api-autocomplete";
  static const String PLACE_DETAILS_URL = "/api/v1/config/place-api-details";

  static const String PLACE_ORDER_URL = "/api/v1/customer/order/place";
}
