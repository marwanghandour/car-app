import 'package:car_app/domain/entities/car_entity.dart';

abstract class TeslaState {}

class TeslaLoading extends TeslaState {}

class TeslaLoaded extends TeslaState {
  final List<CarEntity> products;

  TeslaLoaded(this.products);
}

class TeslaError extends TeslaState {
  final String message;

  TeslaError(this.message);
}