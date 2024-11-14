import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_theme.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeMode: ThemeMode.system, themeData: AppTheme.lightTheme)) {
    on<ToggleThemeEvent>((event, emit) {
      if (state.themeMode == ThemeMode.dark) {
        emit(ThemeState(themeMode: ThemeMode.light, themeData: AppTheme.lightTheme));
      } else {
        emit(ThemeState(themeMode: ThemeMode.dark, themeData: AppTheme.darkTheme));
      }
    });

    on<SetSystemThemeEvent>((event, emit) {
      emit(ThemeState(themeMode: ThemeMode.system, themeData: AppTheme.lightTheme)); // Default light theme when system theme is set
    });
  }
}

