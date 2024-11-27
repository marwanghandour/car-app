import 'package:car_app/core/utils/app_icons.dart';
import 'package:car_app/Features/home/presentation/blocs/theme/theme_bloc.dart';
import 'package:car_app/Features/home/presentation/blocs/theme/theme_event.dart';
import 'package:car_app/Features/home/presentation/widgets/components/custom_search.dart';
import 'package:car_app/Features/home/presentation/widgets/main_components/home_view_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  

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
      body: const HomeViewWidgets(),
    );
  }
}
