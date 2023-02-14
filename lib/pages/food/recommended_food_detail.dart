import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/routes/route_help.dart';
import 'package:fooddelivery/utils/app_constants.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId; //final하면 밑줄에 const
  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(

      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [ //bool automaticallyImplyLeading = true 이게 화면에 뒤로가기를 만든다
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: AppIcon(icon: Icons.clear),
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                )
                ,
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                child: Container(
                  child: Center(
                      child: BigText(
                          size: Dimensions.font26, text: product.name!)), //title
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                ),
                preferredSize: Size.fromHeight(20)),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(

            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandableTextWidget(text: product.description!)
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    icon: Icons.remove,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24),
                BigText(text: "\$${product.price! } "+" X "+" 0 ",color: AppColors.mainBlackColor, size: Dimensions.font26),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height10),
            decoration: BoxDecoration(
                color: Colors.grey[200],

                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20, right: Dimensions.width20,),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                    size: Dimensions.iconSize24,
                  ),

                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20, right: Dimensions.width20,),

                  child: BigText(text: "\$12.99 | Add to Cart",color: Colors.white,),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20)
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
