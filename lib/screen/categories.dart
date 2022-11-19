import 'package:flutter/material.dart';
import 'package:orderfood/models/food_categories_modle.dart';
import 'package:orderfood/screen/widget/bottom_Contianer.dart';

class Categories extends StatelessWidget {
  List<FoodCategoriesModle> list = [];
  Categories({required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        shrinkWrap: false,
        primary: false,
        children: list
            .map(
              (e) => BottomContainer(
                image: e.image,
                price: e.price,
                name: e.name,
                onTap: () {},
              ),
            )
            .toList(),
      ),
    );
  }
}
