import 'package:car_app/Features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     
      body: HomeView(),
    );
  }
}

