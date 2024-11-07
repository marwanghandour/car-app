import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInt(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw const FormatException();
      return Right(integer);
    } catch (e) {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
