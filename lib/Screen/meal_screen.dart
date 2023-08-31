import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_browse/Screen/meal_detail_screen.dart';
import 'package:meal_browse/model/catagory_Model.dart';
import 'package:meal_browse/widget/meal_items.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {required this.tital, super.key, required this.mealsOFThatCategory});

  // tital of that category
  final String tital;

  // list of the meal which Belongs to that category
  final List<MealDetailsModel> mealsOFThatCategory;

  // navigate the meal detail screen, also used in Favourite tab
  static void onMealDetailSelect(BuildContext context, int index,
      List<MealDetailsModel> mealsOFThatCategory) {
    //
    // Navigate to MealDetailScreen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            MealDetailScreen(selectedMealDetails: mealsOFThatCategory[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // Category title
        title: Text(tital),
        centerTitle: false,
        leading: IconButton(
            tooltip: "Back",
            constraints: const BoxConstraints.expand(),
            onPressed: () {
              HapticFeedback.vibrate();

              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),

      //list of meals
      body: ListView.builder(
        itemCount: mealsOFThatCategory.length,
        itemBuilder: (context, index) {
          // Meal Items card
          return MealItem(
            meal: mealsOFThatCategory[index],
            onselectmeal: (meal) {
              onMealDetailSelect(context, index, mealsOFThatCategory);
            },
          );
        },
      ),
    );
  }
}
