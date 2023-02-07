import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/app_column.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/icon_and_text_widget.dart';
import 'package:fooddelivery/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        //print("Current value is" +_currPageValue.toString());
//Widget _buildPageItem에서 계속
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  //첫번째 스택에서 왼쪽,오른쪽 내용 나오게하기위해
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //사이즈들이 하드코드 돼있어서//slider section
        GetBuilder<PopularProductController>(builder:(popularProducts){
          return Container(
            height: Dimensions.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length, //이거 안해주면 에러남 0일때 에러남 1로 해줘야함
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              },
            ),
          );
          /*return Container(
            height: Dimensions.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              },
            ), 원래 이거였는데 getbuilder 이용하기 위해 바꿈
          );*/
        }),
        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              color: Colors.black87, // Inactive color
              activeColor: AppColors.mainColor,
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
            margin: EdgeInsets.only(left: Dimensions.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Popular"),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 3,
                  ),
                  child: BigText(text: ".", color: Colors.black26),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                    margin: const EdgeInsets.only(
                      bottom: 2,
                    ),
                    child: SmallText(text: "Food paring")),
                //list of food and images
              ],
            )),
        Container(

            child: ListView.builder(
                shrinkWrap: true,
                //main_food_page에서 FoodPageBody()를Expanded로 감싸줘서 에러없앰
                physics: NeverScrollableScrollPhysics(),
                //shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10),
                      child: Row(
                        children: [
                          //image section
                          Container(
                              width: Dimensions.listViewImgSize,
                              height: Dimensions.listViewImgSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/image/food1.jpg")))),
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextContSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text: "Nutritious fruit meal in China"),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(
                                        text: "With chinese characteristics"),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: AppColors.iconColor1),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: "1.7km",
                                            iconColor: AppColors.mainColor),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: "32min",
                                            iconColor: AppColors.iconColor2)
                                      ],
                                    )

                                    //overflow.ellipsis때문에 ...으로 나옴
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //text container
                        ],
                      ));
                }))
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } //밑에 Stack을 Transform 으로 감싸줌
    else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        //continue take the size or height
        //container안에 넣어도 사이즈 유지하기위해
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: index.isEven ? Color(0xff69c5df) : Color(0xFF9294cc),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food1.jpg")),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                ],
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15, left: 15, right: 10),
                  child: AppColumn(text: "Chinese Side")),
            ),
          ),
        ],
      ),
    );
  }
}
