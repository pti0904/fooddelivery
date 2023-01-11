import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/image/food1.jpg'),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),

          ),

        ],
      )
    );
  }
}
