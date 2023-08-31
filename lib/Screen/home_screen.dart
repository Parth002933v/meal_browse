import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_browse/utils/theme_getter.dart';

import '../main.dart';

import '../widget/navigation_bar.dart';
import '../widget/tabs/favourite_tab.dart';
import '../widget/tabs/home_tab.dart';
import '../widget/tabs/search_tab.dart';
import '../widget/tabs/setting_tab.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  // Listen value of latest tab screen
  final ValueNotifier<Widget> activeTabScreen = ValueNotifier(const HomeTab());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ThemeGetter.isDarkTheme(context);

    //Initialise media query value
    mq = MediaQuery.of(context).size;

    // Showing current tab index
    int tabIndex = 0;

    // Run whenever the tab is changed
    void changeTab(int value) {
      // Add new tab index
      tabIndex = value;

      // Display active screen accordingly tab index
      switch (tabIndex) {
        case 0:
          {
            activeTabScreen.value = const HomeTab();

            break;
          }

        case 1:
          {
            activeTabScreen.value = const FavouriteTab();
            break;
          }
        case 2:
          {
            activeTabScreen.value = const SearchTab();

            break;
          }

        case 3:
          {
            activeTabScreen.value = const SettingTab();

            break;
          }
      }
    }

    return Scaffold(
      // ValueListenableBuilder to change the tab
      body: ValueListenableBuilder<Widget>(
        // Listen to changes in the activeTabScreen ValueNotifier
        valueListenable: activeTabScreen,

        builder: (context, value, child) {
          // Build the UI using the latest value of activeTabScreen
          return AnimatedSwitcher(
            // Set the duration for the switch animation
            duration: const Duration(milliseconds: 200),

            // Customize the animation curve when transitioning in
            switchInCurve: Curves.easeInOut,

            // Customize the animation curve when transitioning out
            switchOutCurve: Curves.easeInOut,

            // Define the transition effect using transitionBuilder
            transitionBuilder: (child, animation) {
              // Apply a FadeTransition to the child using the animation
              return FadeTransition(
                opacity: animation, // Animation progress for fading
                child: child, // The child widget being transitioned
              );
            },

            // The child to display within the AnimatedSwitcher
            child: value,
          );
        },
      ),

      // bottomNavigationBar: CustomNavigationBar(
      //   isDarkMode: isDarkMode,
      //   activeTabScreen: activeTabScreen,
      // ),

      bottomNavigationBar: CustomNavigationBar(
        isDarkMode: isDarkMode,
        chageTab: (value) => changeTab(value),
        tabIndex: tabIndex,
      ),
    );
  }
}
