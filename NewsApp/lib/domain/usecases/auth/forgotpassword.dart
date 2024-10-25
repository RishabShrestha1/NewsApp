import 'package:dartz/dartz.dart';
import 'package:newsapp_self/core/usecase/usecase.dart';
import 'package:newsapp_self/data/models/auth/forgot_user_pass.dart';
import 'package:newsapp_self/domain/repository/auth/auth_repo.dart';
import 'package:newsapp_self/service_locator.dart';

class ForgotpasswordUseCase implements Usecase<Either, ForgotUserPasswordReq> {
  @override
  Future<Either> call({ForgotUserPasswordReq? params}) {
    return sl<AuthRepository>().forgotPassword(params!);
  }
}
