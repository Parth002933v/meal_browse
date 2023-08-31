import 'dart:developer';

import 'package:awesome_icons/awesome_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../model/catagory_Model.dart';
import 'meal_item_tray.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
    required this.meal,
    required this.onselectmeal,
  }) : super(key: key);

  final MealDetailsModel meal;
  final void Function(MealDetailsModel meal) onselectmeal;

  String get complexitytext {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordtibility {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onselectmeal(meal);

        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: CachedNetworkImage(
                imageUrl: meal.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                height: mq.height * .24,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.image_outlined)),
              ),
            ),

            // details of that image
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,

              // Content of image
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54.withOpacity(0.3),

                //column
                child: Column(
                  children: [
                    //meal name
                    Text(
                      meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    // some space
                    SizedBox(height: mq.height * .01),

                    // meal summary
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // duration
                        MealItemtrait(
                          icon: Icons.timer_outlined,
                          lable: '${meal.duration} min',
                        ),

                        // some space
                        SizedBox(width: mq.width * .02),

                        //Complexity
                        MealItemtrait(
                          icon: Icons.polyline_sharp,
                          lable: complexitytext,
                        ),

                        // some space
                        SizedBox(width: mq.width * .02),

                        // Affordability
                        MealItemtrait(
                          icon: Icons.attach_money,
                          lable: affordtibility,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
