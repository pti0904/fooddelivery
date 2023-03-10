import 'package:flutter/material.dart';
import 'package:fooddelivery/data/repository/cart_repo.dart';
import 'package:fooddelivery/models/cart_model.dart';
import 'package:fooddelivery/models/products_model.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    //item update
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {

        totalQuantity = value.quantity! + quantity;

        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
      if(totalQuantity<=0){
        _items.remove(product.id);
      }
    } else {
      if(quantity>0){
        //print("length of the item is "+_items.length.toString());
        _items.putIfAbsent(product.id!, () {
          //putIfAbsent()는 key가 없으면 추가하고 있으면 추가하지 않는다.
          return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString());
        });
      }else{
        Get.snackbar("Item count", "You should at least add 1 item in the cart !",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,);
      }
    }
  } //addItem //카트에 아이템을 추가한다.

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  } //existInCart //이미 카트에 있는지 확인

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  } //getQuantity //카트에 있는 아이템의 수량을 가져온다.

  int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value){
      totalQuantity += value.quantity!;  //totalQuantity = totalQuantity + value.quantity; 랑 같은 뜻
    });
    return totalQuantity;
  } //totalItems //카트에 있는 아이템의 총 수량을 가져온다.
}
