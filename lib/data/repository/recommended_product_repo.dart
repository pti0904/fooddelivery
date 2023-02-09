import 'package:fooddelivery/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;//api클라이언트를 repo제품에 전달 to instance 생성
  RecommendedProductRepo ({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI); //호출 수행
  }
}