import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/app_column.dart';
import 'package:fooddelivery/widgets/app_icon.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage("assets/image/food1.jpg"),
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
                    AppColumn(text: "Chinese Side"),
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
                                "chinccchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckkckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckck"),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
                    Icon(Icons.remove, color: AppColors.signColor),
                    SizedBox(width: Dimensions.width10 / 2), //5
                    BigText(
                      text: "0",
                    ),
                    SizedBox(width: Dimensions.width10 / 2), //5
                    Icon(Icons.add, color: AppColors.signColor),
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
                child: BigText(
                  text: "\$10 | Add to Cart",
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
              )
            ],
          )),
    );
  }
}
