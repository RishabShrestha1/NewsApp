import 'package:dartz/dartz.dart';
import 'package:newsapp_self/core/usecase/usecase.dart';
import 'package:newsapp_self/data/models/auth/signin_user_req.dart';
import 'package:newsapp_self/domain/repository/auth/auth_repo.dart';
import 'package:newsapp_self/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
