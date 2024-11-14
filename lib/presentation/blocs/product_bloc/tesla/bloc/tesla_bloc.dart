import 'package:car_app/domain/usecases/get_product.dart';
import 'package:car_app/presentation/blocs/product_bloc/tesla/bloc/tesla_event.dart';
import 'package:car_app/presentation/blocs/product_bloc/tesla/bloc/tesla_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Tesla extends Bloc<TeslaEvent, TeslaState> {
  final GetProducts getTeslas;

  Tesla(this.getTeslas) : super(TeslaLoading()) {
    on<FetchTesla>(_onFetchTeslas);
  }

  void _onFetchTeslas(FetchTesla event, Emitter<TeslaState> emit) async {
    emit(TeslaLoading());
    try {
      final products = await getTeslas();
      emit(TeslaLoaded(products)); 
    } catch (e) {
      emit(TeslaError(e.toString()));
    }
  }

}
