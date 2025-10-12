import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:mobile_finus_ai_codenox/app/data/models/auth/login_model.dart';
import 'package:mobile_finus_ai_codenox/app/domain/entities/constant.dart';
import 'package:mobile_finus_ai_codenox/core/services/api_service.dart';
import 'package:mobile_finus_ai_codenox/core/services/injection.dart';

abstract class AuthDataSource {
  Future<LoginModel> login(LoginParams params);
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  var apiService = getIt<ApiService>();
  @override
  Future<LoginModel> login(LoginParams params) async {
    final response = await apiService.connect(
        Constant.login, await params.toJson(), Constant.post);
    return loginModelFromJson(jsonEncode(response.data));
  }
}
