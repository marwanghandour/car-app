import 'package:flutter_bloc/flutter_bloc.dart';

class FormBloc extends Cubit<bool> {
  FormBloc() : super(false);

  void togglePasswordVisibility() => emit(!state);
}