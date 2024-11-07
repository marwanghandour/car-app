import 'package:car_app/presentation/widgets/components/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../core/utils/app_icons.dart';
import '../blocs/theme/theme_bloc.dart';
import '../blocs/theme/theme_event.dart';
import '../widgets/navigation/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomSearchBar(),


         actions: [
          IconButton(
            icon: const Icon(AppIcons.switchtheme),
          onPressed: () {
            BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent());
            
          },
          ),
        ],
      ),
      body: BottomNavBar(controller: _controller),
    );
  }
}

