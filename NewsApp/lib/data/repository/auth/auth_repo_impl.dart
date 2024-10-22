import 'package:dartz/dartz.dart';
import 'package:newsapp_self/data/models/auth/create_user_req.dart';
import 'package:newsapp_self/data/models/auth/forgot_user_pass.dart';
import 'package:newsapp_self/data/models/auth/signin_user_req.dart';
import 'package:newsapp_self/data/sources/auth/auth_firebase_service.dart';
import 'package:newsapp_self/domain/repository/auth/auth_repo.dart';
import 'package:newsapp_self/service_locator.dart';

class AuthRepositoryImp extends AuthRepository {
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signinUserReq);
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }

  @override
  Future<Either> forgotPassword(
      ForgotUserPasswordReq forgotUserPasswordReq) async {
    return await sl<AuthFirebaseService>()
        .forgotPassword(forgotUserPasswordReq);
  }

  @override
  Future<Either> googleSignin() async {
    return await sl<AuthFirebaseService>().googleSignIn();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
