import 'package:flutter/material.dart';
import 'package:meal_browse/Screen/meal_screen.dart';

import 'package:meal_browse/main.dart';
import 'package:meal_browse/model/catagory_Model.dart';

import '../../data/dummy_data.dart';
import '../catagory_button.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //get all the list of Category
    final List<MealCatagoryModel> categoryList = availableCategories;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select catagory"),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: mq.width * .01, right: mq.width * .01),

        // GridViev to display grid
        child: GridView(
          //shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),

          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //   childAspectRatio: 1.3,
          //   maxCrossAxisExtent: 190,
          //   crossAxisSpacing: mq.width * .03,
          //   mainAxisSpacing: mq.height * .02,
          // ),

          children: [
            // List of categories
            ...categoryList.map(
              (catagoryList) => CatagoryGridItem(
                catagory: catagoryList,
                onSelectCatagory: (catagory) {
                  _selectMealCatagory(context, catagory);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _selectMealCatagory(BuildContext context, MealCatagoryModel catagory) {
    final meals = dummyMeals
        .where((meal) => meal.categories.contains(catagory.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            MealScreen(tital: catagory.title, mealsOFThatCategory: meals),
      ),
    );
  }
}
