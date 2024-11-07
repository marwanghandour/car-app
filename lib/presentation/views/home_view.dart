import 'package:car_app/presentation/widgets/main_components/home_view_widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewWidgets(),
    );
  }
}
