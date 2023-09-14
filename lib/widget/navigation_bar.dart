import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../main.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
    required this.isDarkMode,
    required this.chageTab,
    required this.tabIndex,
  });

  final bool isDarkMode;
  final void Function(int value) chageTab;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black12.withOpacity(0.05) : Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.3),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .02, vertical: mq.height * .008),
          child: GNav(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .03, vertical: mq.height * .015),

            onTabChange: (value ) {
              chageTab(value);
            },

            //  selectedIndex: Screenindex.value,
            //rippleColor: Colors.red.shade600,
            //hoverColor: Colors.greSy.shade600,

            gap: 9,

            // Which tab is selected
            selectedIndex: tabIndex,

            // selected color
            activeColor:
                isDarkMode ? Colors.white : Colors.black, // selected color

            //icon Size..
            iconSize: 29,

            // animation time
            duration: const Duration(milliseconds: 400),
//            tabBackgroundColor: flexScheme.primaryContainer,

            // background color
            tabBackgroundColor:
                isDarkMode ? const Color(0xff232023) : Colors.white,

            // Unselected color
            color: isDarkMode ? Colors.grey : Colors.black,

            // tabs
            tabs: [
              // home
              GButton(
                rippleColor: isDarkMode ? null : const Color(0xffe9d4ef),
                hoverColor: isDarkMode ? null : const Color(0xffe9d4ef),
                backgroundColor: isDarkMode ? null : const Color(0xffe9d4ef),
                iconActiveColor: isDarkMode ? null : const Color(0xff692a83),
                textColor: isDarkMode ? null : const Color(0xff692a83),
                icon: Icons.home_outlined,
                text: 'Home',
                // onPressed: () {
                //   activeTabScreen.value = const HomeTab();
                // },
              ),

              //Likes
              GButton(
                rippleColor: isDarkMode ? null : const Color(0xfff6d3e1),
                hoverColor: isDarkMode ? null : const Color(0xfff6d3e1),
                iconActiveColor: isDarkMode ? null : const Color(0xffcd5a82),
                textColor: isDarkMode ? null : const Color(0xffcd5a82),
                backgroundColor: isDarkMode ? null : const Color(0xfff6d3e1),
                icon: Icons.favorite_border,
                text: 'Likes',
                // onPressed: () {
                //   activeTabScreen.value = const FavouriteTab();
                // },
              ),

              // Search
              GButton(
                rippleColor: isDarkMode ? null : const Color(0xfffdf0d2),
                hoverColor: isDarkMode ? null : const Color(0xfffdf0d2),
                iconActiveColor: isDarkMode ? null : const Color(0xffeeb94b),
                textColor: isDarkMode ? null : const Color(0xffeeb94b),
                backgroundColor: isDarkMode ? null : const Color(0xfffdf0d2),
                icon: Icons.search,
                text: 'Search',
                // onPressed: () {
                //   activeTabScreen.value = const SearchTab();
                // },
              ),

              // Profile
              GButton(
                rippleColor: isDarkMode ? null : const Color(0xffd4e9eb),
                hoverColor: isDarkMode ? null : const Color(0xffd4e9eb),
                iconActiveColor: isDarkMode ? null : const Color(0xff4a8d87),
                textColor: isDarkMode ? null : const Color(0xff4a8d87),
                backgroundColor: isDarkMode ? null : const Color(0xffd4e9eb),
                icon: Icons.settings,
                // onPressed: () {
                //   activeTabScreen.value = const SettingTab();
                // },
                text: 'Setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
