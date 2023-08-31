import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/catagory_Model.dart';

class FavouriteMealNotifier extends StateNotifier<List<MealDetailsModel>> {
  FavouriteMealNotifier() : super([]);

  //
  bool toggleMealFavouriteStatus(MealDetailsModel meal) {
    if (state.contains(meal)) {
      // If it is favourite it will remove
      state = state.where((stateMeal) => stateMeal.id != meal.id).toList();

      print('removed');
      return false; // not exist
    } else {
      // if is is not favourite it will add it
      state = [...state, meal];
      print("added");
      return true; // exist
    }
  }
}

//create provider of favourite meal
final favouriteMealProvider =
//................... provider return type , value return type.......
    StateNotifierProvider<FavouriteMealNotifier, List<MealDetailsModel>>(
        (ref) => FavouriteMealNotifier()); // provider class name
