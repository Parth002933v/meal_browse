import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Provider/favourite_meal_provider.dart';
import '../model/catagory_Model.dart';
import '../widget/meal_detail_content.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    super.key,
    required this.selectedMealDetails,
  });

  final MealDetailsModel selectedMealDetails;

  @override
  Widget build(BuildContext context) {
    String mealID = selectedMealDetails.id;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final providerMeals = ref.watch(favouriteMealProvider);

              final isFavourite = providerMeals.contains(selectedMealDetails);

              // Add to favourite icon
              return IconButton(
                tooltip: 'Favourite',
                onPressed: () {
                  final isAddToFavouret = ref
                      .read(favouriteMealProvider.notifier)
                      .toggleMealFavouriteStatus(selectedMealDetails);

                  ScaffoldMessenger.of(context).clearSnackBars();
                  if (isAddToFavouret) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Marked As Favourite')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Removed From Favourite ')));
                  }
                },
                icon: isFavourite
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border),
              );
            },
          ),
        ],
        title: Text(selectedMealDetails.title),
        leading: IconButton(
            tooltip: "Back",
            constraints: const BoxConstraints.expand(),
            onPressed: () {
              HapticFeedback.vibrate();

              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MealDetailContent(mealContent: selectedMealDetails, mealID: mealID),
          ],
        ),
      ),
    );
  }
}
