import 'package:fooddelivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  //이닛하기전에 PopularProductRepo를 인스턴스화 해야 getPopularProductList()를 호출할 수 있다.
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = []; //빈 리스트를 만들어서 여기에 데이터를 넣는다.
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response =
        await popularProductRepo.getPopularProductList(); //호출 수행
    if (response.statusCode == 200) {
      //데이터를 리스트에 넣는다. 성공하면 statusCode==200
      print("get products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      update();
    } else {
      print(
          "get products error: ${response.statusCode} ${response.statusText}"); //실패하면 메시지를 출력한다.
    }
  }
}
