import 'package:dartz/dartz.dart';
import 'package:foodpanda_clean_code/domain/util/app_error.dart';

abstract class UseCase<Type, Parameter> {
  Either<AppError, Type> call(Parameter parameter);
}

abstract class UseCaseFuture<Type, Parameter> {
  Future<Either<AppError, Type>> call(Parameter parameter);
}

// abstract class UseCaseNoError<Type, Params> {
//   Type call(Params params);
// }

// abstract class UseCaseNoErrorFuture<Type, Params> {
//   Future<Type> call(Params params);
// }
