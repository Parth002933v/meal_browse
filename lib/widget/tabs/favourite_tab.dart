import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_browse/Provider/favourite_meal_provider.dart';
import 'package:meal_browse/Screen/meal_screen.dart';
import 'package:meal_browse/main.dart';
import 'package:meal_browse/widget/meal_items.dart';

class FavouriteTab extends ConsumerWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMealList = ref.watch(favouriteMealProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),

      // body
      body: favouriteMealList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Uh oh... nothing here !',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: mq.height * .02,
                  ),
                  Text(
                    'try selecting different catagoru ',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: favouriteMealList.length,
              itemBuilder: (context, index) {
                return MealItem(
                  meal: favouriteMealList[index],
                  onselectmeal: (meal) {
                    MealScreen.onMealDetailSelect(
                        context, index, favouriteMealList);
                  },
                );
              },
            ),
    );
  }
}
