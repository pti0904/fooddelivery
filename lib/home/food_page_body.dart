import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  //첫번째 스택에서 왼쪽,오른쪽 내용 나오게하기위해
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      //continue take the size or height
      //container안에 넣어도 사이즈 유지하기위해
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              color: index.isEven ? Color(0xff69c5df) : Color(0xFF9294cc),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food1.jpg")),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF69c5df),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                )
              ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 140,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 10),
              

            ),
          ),
        ),
      ],
    );
  }
}
