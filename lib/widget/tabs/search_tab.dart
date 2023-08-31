import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_browse/data/dummy_data.dart';

import '../../main.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    final meal = dummyMeals;
    return Scaffold(
      appBar: AppBar(title: Text("Search the Meal")),
      body: SearchBar(),
    );
  }
}
