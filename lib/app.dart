import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_routes.dart';
import 'dependency_injection.dart';
import 'presentation/blocs/product_bloc/product_bloc.dart';
import 'presentation/blocs/product_bloc/product_event.dart';
import 'presentation/blocs/theme/theme_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => sl<ProductBloc>()..add(FetchProducts()),
          lazy: true,
        ),
        

      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
          );
        },
      ),
    );
  }
}
