import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'food_page_body.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/small_text.dart';
import '/utils/colors.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is"+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            //Column으로 묵어서 다 top에 위치하게
            child: Container(
              margin: EdgeInsets.only(top: 50, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //주측(가로)끝과 끝 배치 위젯과 위젯사이 간격 동일하게 배치
                //spaceAround <- evenly보다 여백 작게
                children: [
                  Column(
                    children: [
                      BigText(text: "한국", color: AppColors.mainColor, size: 30,),
                      Row(
                        children: [
                          SmallText(text: "연남동", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),


                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white,size: Dimensions.iconSize24),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            //맨 위로 못올림
            child: FoodPageBody(),
          ))
        ],
      )
    );
  }
}
