import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_product.dart';
import 'product_event.dart';
import 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc(this.getProducts) : super(ProductLoading()) {
    on<FetchProducts>(_onFetchProducts);
  }

  void _onFetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
