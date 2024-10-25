import 'package:dartz/dartz.dart';
import 'package:newsapp_self/core/usecase/usecase.dart';
import 'package:newsapp_self/data/models/auth/no_params.dart';
import 'package:newsapp_self/domain/repository/auth/auth_repo.dart';
import 'package:newsapp_self/service_locator.dart';

class FacebookSigninUsecase extends Usecase<void, NoParams> {
  @override
  Future<Either> call({NoParams? params}) async {
    return sl<AuthRepository>().facebookSignin();
  }
}
