import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../views/home_view.dart';

class BottomNavBar extends StatelessWidget {
  final PersistentTabController controller;

  const BottomNavBar({super.key, required this.controller});

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const HomeView(),
      const HomeView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: isDarkMode ? AppColors.primaryDark : AppColors.primaryLight,
        inactiveColorPrimary: isDarkMode ? AppColors.onSurfaceDark : AppColors.onSurfaceLight,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Search",
        activeColorPrimary: isDarkMode ? AppColors.primaryDark : AppColors.primaryLight,
        inactiveColorPrimary: isDarkMode ? AppColors.onSurfaceDark : AppColors.onSurfaceLight,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: isDarkMode ? AppColors.primaryDark : AppColors.primaryLight,
        inactiveColorPrimary: isDarkMode ? AppColors.onSurfaceDark : AppColors.onSurfaceLight,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineToSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style1, 
      backgroundColor: isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
    );
  }
}
