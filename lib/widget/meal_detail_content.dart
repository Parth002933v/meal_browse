import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_browse/utils/theme_getter.dart';

import '../model/catagory_Model.dart';

class MealDetailContent extends StatelessWidget {
  const MealDetailContent({
    Key? key,
    required this.mealContent,
    required this.mealID,
  }) : super(key: key);

  final MealDetailsModel mealContent;
  final String mealID;

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeGetter.isDarkTheme(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //hero animation
          Hero(
            tag: mealID,

            // Meal Image
            child: CachedNetworkImage(
              // height: 200,
              // width: double.infinity,
              // fit: BoxFit.cover,
              imageUrl: mealContent.imageUrl,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error_outline),
            ),
          ),

          // some space
          const SizedBox(height: 10),

          // Ingredients
          Text(
            'Ingredients',
            style: GoogleFonts.armata(
              color: Colors.redAccent,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          // some space
          const SizedBox(height: 10),

          // list of Ingredients
          ...mealContent.ingredients
              .map((ingredient) => Text(
                    ingredient,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ))
              .toList(),

          // some space
          const SizedBox(height: 10),

          // steps
          Text(
            'Steps',
            style: GoogleFonts.armata(
              color: Colors.redAccent,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          //some space
          const SizedBox(height: 10),

          //list of steps
          ...mealContent.steps
              .map((steps) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        steps,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w500,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 13)
                    ],
                  ))
              .toList()
        ],
      ),
    );
  }
}
