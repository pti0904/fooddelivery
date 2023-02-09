import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/pages//home/main_food_page.dart';
import 'package:fooddelivery/pages/food/popular_food_detail.dart';
import 'package:fooddelivery/pages/food/recommended_food_detail.dart';
import 'package:fooddelivery/pages/home/food_page_body.dart';
import 'package:fooddelivery/routes/route_help.dart';
import 'package:get/get.dart';
import 'package:fooddelivery/helper/dependencies.dart' as dep;

import 'controllers/popular_product_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await Future.delayed(Duration(seconds: 1));
  runApp(MyApp());

}



class MyApp extends StatelessWidget {

  const MyApp({super.key});


  // This widget is the root of your application.
  @override


  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      //바탕색깔 설정

      title: 'Flutter Demo',
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial, //getPages는 GetMaterialApp에서 List<GetPage>를 받는다.
      getPages: RouteHelper.routes,  //getPages는 GetMaterialApp에서 List<GetPage>를 받는다.
    );
  }
}
