import 'package:car_app/Features/home/presentation/views/utils/onboarding/on_boarding_screen.dart';
import 'package:car_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../../auth/presentation/blocs/auth/auth_state.dart';
import '../../blocs/splash_bloc/splash_screen_bloc.dart';
import '../main_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with SingleTickerProviderStateMixin {
  late SplashscreenCubit _splashscreenCubit;

  @override
  void initState() {
    super.initState();
    _splashscreenCubit = SplashscreenCubit();
    _splashscreenCubit.startAnimation(this);
  }

  @override
  void dispose() {
    _splashscreenCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _splashscreenCubit,
      child: BlocListener<AuthBloc, MyAuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MainScreen()),
            );
          } else if (state is AuthInitialState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
            );
          }
        },
        child: BlocBuilder<SplashscreenCubit, SplashscreenState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color(0xff000B21),
              body: Opacity(
                opacity: state.opacity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            AppStrings.splash,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Developed by Marwan',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
