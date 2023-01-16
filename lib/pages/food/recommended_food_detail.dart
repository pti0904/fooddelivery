import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/expandable_text_widget.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                BigText(text: "Happy Eat"),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                child: Container(
                  child: Center(
                      child: BigText(
                          size: Dimensions.font26, text: "Chinese Side")),
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
              background: Image(
                image: AssetImage('assets/image/food1.jpg'),
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
                child: ExpandableTextWidget(
                  text:
                      "asdffsasdffsdaasdasdffsdaasdffsdaasdffsdaasdffsdaffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdadaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsd1aasdffsdaas다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다다dffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsdaasdffsda",
                ),
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
                BigText(text: "\$12.99 "+" X "+" 0 ",color: AppColors.mainBlackColor, size: Dimensions.font26),
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

                  child: BigText(text: "\$12.88 | Add to Cart",color: Colors.white,),
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
