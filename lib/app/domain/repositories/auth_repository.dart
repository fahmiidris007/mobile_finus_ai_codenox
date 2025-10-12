import 'package:dartz/dartz.dart';
import 'package:mobile_finus_ai_codenox/app/data/models/auth/login_model.dart';
import 'package:mobile_finus_ai_codenox/app/data/models/error_model.dart';

abstract class AuthRepository {
  Future<Either<ErrorModel, LoginModel>> login(LoginParams params);
}
