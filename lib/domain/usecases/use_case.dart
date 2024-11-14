import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
    Future<Either<Failure, Type>> call2(Params params);

}
