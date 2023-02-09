import 'package:fooddelivery/pages/food/popular_food_detail.dart';
import 'package:fooddelivery/pages/food/recommended_food_detail.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial="/"; //main.dart에 initialRoute: RouteHelper.initial,
  static const String popularFood="/popular-food"; //main.dart에 getPages: RouteHelper.routes,
  static String getPopularFood()=> '$popularFood';


  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: popularFood, page:() {
      print("popularFood get called");
      return PopularFoodDetail();
    },
          transition: Transition.downToUp,
    ),
    GetPage(name: "/", page: ()=>RecommendedFoodDetail()),
  ];


}