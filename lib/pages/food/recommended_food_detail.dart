import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fooddelivery/widgets/big_text.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          bottom: PreferredSize(
              child: Container(
                color: Colors.white,
                child: Center(child: BigText(size:Dimensions.font26, text: "Chinese Side")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top:5, bottom: 10),
              ), preferredSize: Size.fromHeight(20)),
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
          child: Text(
              "chinccchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckkckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchinccchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckkckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchinccchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckkckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckckchincckck"),
        )
      ],
    ));
  }
}
