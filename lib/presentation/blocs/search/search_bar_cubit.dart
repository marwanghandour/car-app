import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarCubit extends Cubit<bool> {
  SearchBarCubit() : super(false);

  void toggleSearch() => emit(!state);
}
