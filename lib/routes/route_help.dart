import 'package:fooddelivery/pages/food/popular_food_detail.dart';
import 'package:fooddelivery/pages/food/recommended_food_detail.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial="/"; //main.dart에 initialRoute: RouteHelper.initial,
  static const String popularFood="/popular-food"; //main.dart에 getPages: RouteHelper.routes,
  static const String recommendedFood="/recommended-food"; //main.dart에 getPages: RouteHelper.routes,
  static String getPopularFood(int pageId)=> '$popularFood?pageId=$pageId';
  static String getInitial()=> '$initial';
  static String getRecommendedFood(int pageId)=> '$recommendedFood?pageId=$pageId';



  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: popularFood, page:() {
      var pageId = Get.parameters['pageId'];
      //print("popularFood get called");
      return PopularFoodDetail(pageId:int.parse(pageId!));
    },
          transition: Transition.downToUp,
    ),
    GetPage(name: recommendedFood, page:() {
      var pageId = Get.parameters['pageId'];

      return RecommendedFoodDetail(pageId:int.parse(pageId!));
    },
          transition: Transition.downToUp,
    )

  ];


}