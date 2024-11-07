import 'package:flutter/material.dart';
import '../../../widgets/main_components/get_started_widgets.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: GetStartedWidgets(),
    );
  }
}