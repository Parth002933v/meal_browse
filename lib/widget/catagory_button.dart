// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../model/catagory_Model.dart';

class CatagoryGridItem extends StatelessWidget {
  const CatagoryGridItem({
    Key? key,
    required this.catagory,
    required this.onSelectCatagory,
  }) : super(key: key);

  final MealCatagoryModel catagory;
  final void Function(MealCatagoryModel catatory) onSelectCatagory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.white.withOpacity(0.3),
      onTap: () {
        onSelectCatagory(catagory);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              catagory.color.withOpacity(0.55),
              catagory.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          catagory.title,
          style: GoogleFonts.lato(
            color: Colors.white.withOpacity(0.8),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
