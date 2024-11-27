import 'package:car_app/Features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:car_app/Features/home/presentation/blocs/theme/theme_bloc.dart';
import 'package:car_app/core/utils/app_routes.dart';
import 'package:car_app/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/auth/data/sources/supabase_auth_sources.dart';
import 'Features/home/presentation/blocs/theme/theme_state.dart';

class MyApp extends StatelessWidget {
  final SupabaseAuthSource authSource;
  const MyApp(this.authSource, {super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(authSource),
        ),
      ],
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
