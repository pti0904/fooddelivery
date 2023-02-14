import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:fooddelivery/utils/app_constants.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/app_column.dart';
import 'package:fooddelivery/widgets/app_icon.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    //print("page is id " +pageId.toString());
    //print("product is " +product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        AppConstants.BASE_URL + AppConstants.UPLOAD_URL+ product.img!,
                      ),
                      fit: BoxFit.cover),
                ),
              )),
          //icon widgets
          Positioned(
              top: Dimensions.height10 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: AppIcon(icon: Icons.arrow_back_ios),
                    onTap: () {
                      Get.to(()=>MainFoodPage());
                    },
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          //introduction of food
          Positioned(
            top: Dimensions.popularFoodImgSize - 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height10 * 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                product.description!),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
            height: Dimensions.height10 * 12,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            popularProduct.setQuantity(false);
                          },
                          child: Icon(Icons.remove, color: AppColors.signColor)),
                      SizedBox(width: Dimensions.width10 / 2), //5
                      BigText(
                        text: popularProduct.inCartItems.toString(),
                      ),
                      SizedBox(width: Dimensions.width10 / 2), //5
                      GestureDetector(
                          onTap: (){
                            popularProduct.setQuantity(true);
                          },
                          child: Icon(Icons.add, color: AppColors.signColor)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      popularProduct.addItem(product);
                    },
                    child: BigText(
                      text: "\$ ${product.price!} | Add to Cart",
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)),
                )
              ],
            ));
      },),
    );
  }
}
