import 'package:flutter/material.dart';
import 'package:fooddelivery/pages//home/main_food_page.dart';
import 'package:fooddelivery/pages/food/popular_food_detail.dart';
import 'package:fooddelivery/pages/food/recommended_food_detail.dart';
import 'package:fooddelivery/pages/home/food_page_body.dart';
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

    return GetMaterialApp(
      //바탕색깔 설정

      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
    );
  }
}
