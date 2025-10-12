import 'package:dartz/dartz.dart';
import 'package:mobile_finus_ai_codenox/app/data/models/error_model.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ErrorModel, Type>> call(Params params);
}
