import 'package:dartz/dartz.dart';
import 'package:nasa_picture/core/usecase/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
