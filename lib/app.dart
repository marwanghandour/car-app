import 'package:car_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_routes.dart';
import 'presentation/blocs/theme/theme_bloc.dart';
import 'presentation/blocs/theme/theme_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            themeMode: state.themeMode, 
            debugShowCheckedModeBanner: false,
            theme: state.themeData,      
            darkTheme: AppTheme.darkTheme, 
            initialRoute: AppRoutes.splash,
            onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
          );
        },
      ),
    );
  }
}
