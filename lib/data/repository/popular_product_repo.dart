import 'package:fooddelivery/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;//api클라이언트를 repo제품에 전달 to instance 생성
  PopularProductRepo ({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI); //호출 수행
  }
}