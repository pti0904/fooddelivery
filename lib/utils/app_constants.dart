class AppConstants{
  static const String APP_NAME = "TIFood";
  static const int APP_VERSION = 1;
  static const String BASE_URL = "http://mvs.bslmeiyu.com";
  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";
  static const String UPLOAD_URL = "/uploads/";

  static const String TOKEN="DBtoken";
//ctrl+b로 확인해보면, static const로 선언된 변수들은 컴파일 시점에 상수로 변환되어 저장된다.
}