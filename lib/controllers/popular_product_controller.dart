import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/data/repository/popular_product_repo.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  //이닛하기전에 PopularProductRepo를 인스턴스화 해야 getPopularProductList()를 호출할 수 있다.
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = []; //빈 리스트를 만들어서 여기에 데이터를 넣는다.
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity; //return _quantity;
  int _inCartItems=0;
  int get inCartItems => _inCartItems+_quantity;
  Future<void> getPopularProductList() async {
    Response response =
        await popularProductRepo.getPopularProductList(); //호출 수행
    if (response.statusCode == 200) {
      //데이터를 리스트에 넣는다. 성공하면 statusCode==200
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print(
          "get products error: ${response.statusCode} ${response.statusText}"); //실패하면 메시지를 출력한다.
    }
  }

  void setQuantity(bool isIncrement){
    if (isIncrement) { //if true
      _quantity = checkQuantity(_quantity+1);
    } else {
      _quantity = checkQuantity(_quantity-1);
    }
    update(); //화면을 갱신한다.
  } //setQuantity
  int checkQuantity(int quantity) {
    if ((quantity+_inCartItems) < 0) {
      Get.snackbar("Item count", "You can't reduce more !",
      backgroundColor: AppColors.mainColor,
          colorText: Colors.white,);
      quantity = 0;

      return 0;
    } else if ((quantity+_inCartItems) > 20) {
      Get.snackbar("Item count", "You can't add more !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,);
      return 20;
    }else{
      return quantity;
    }
  } //checkQuantity
  void initProduct(ProductModel product,CartController cart){
    _quantity = 0;
    _inCartItems=0;
    _cart = cart;
    var exist= false;
    exist = _cart.existInCart(product);
    print("exist is "+exist.toString());
    if(exist){
     _inCartItems = _cart.getQuantity(product);
    }
    print("the quantity in the cart is "+_inCartItems.toString());

    //if exist
    //get from storage _inCartItems =3
  }
  void addItem(ProductModel product){
    if(_quantity>0){
      _cart.addItem(product, _quantity);
      _quantity=0; //reset quantity
      _inCartItems=_cart.getQuantity(product); //update the quantity in the cart
      _cart.items.forEach((key, value) {
        print("The id is "+value.id.toString()+" and the quantity is "+value.quantity.toString());
      });
    }else{
      Get.snackbar("Item count", "You should at least add 1 item in the cart !",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,);
    }

  }
}
