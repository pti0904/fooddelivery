import 'package:get/get.dart';


class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  //844/220 에러 뜰건데 GetMaterialApp으로 main.dart를 바꿔야한다
  static double pageView = screenHeight/2.64;
  static double pageViewContainer = screenHeight/3.84;
  //844/120
  static double pageViewTextContainer = screenHeight/7.03;
  //dynamic height padding and margin
  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.27; //844/15
  static double height20 = screenHeight/42.2;
  static double height30 = screenHeight/28.13;
  //dynamic width padding and margin

  static double width10 = screenHeight/84.4;
  static double width15 = screenHeight/56.27; //844/15
  static double width20 = screenHeight/42.2;
  static double width30 = screenHeight/28.13;

  static double radius10 = screenHeight/84.4;
  static double radius15 = screenHeight/56.27; //844/15
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;
  //dynamic font
  static double font20= screenHeight/42.2;
  static double font26= screenHeight/32.46;
  //icon Size
  static double iconSize24= screenHeight/35.17;
  static double iconSize16= screenHeight/52.75;
  //list view size
  static double listViewImgSize = screenHeight/7.03;
  static double listViewTextContSize = screenHeight/8.44;
  //popular food
  static double popularFoodImgSize = screenHeight/2.41;

}