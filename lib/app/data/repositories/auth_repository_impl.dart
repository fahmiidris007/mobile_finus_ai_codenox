import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_finus_ai_codenox/app/data/models/auth/login_model.dart';
import 'package:mobile_finus_ai_codenox/app/data/models/error_model.dart';
import 'package:mobile_finus_ai_codenox/app/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<ErrorModel, LoginModel>> login(LoginParams params) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
