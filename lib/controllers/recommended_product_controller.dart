import 'package:fooddelivery/data/repository/recommended_product_repo.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  //이닛하기전에 PopularProductRepo를 인스턴스화 해야 getPopularProductList()를 호출할 수 있다.
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = []; //빈 리스트를 만들어서 여기에 데이터를 넣는다.
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
    await recommendedProductRepo.getRecommendedProductList(); //호출 수행
    if (response.statusCode == 200) {
      //데이터를 리스트에 넣는다. 성공하면 statusCode==200
      print("get recommended");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print(
          "could not get recommended"); //실패하면 메시지를 출력한다.
    }
  }
}
