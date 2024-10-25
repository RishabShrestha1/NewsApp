import 'package:dartz/dartz.dart';
import 'package:newsapp_self/data/models/auth/create_user_req.dart';
import 'package:newsapp_self/data/models/auth/forgot_user_pass.dart';
import 'package:newsapp_self/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signIn(SigninUserReq signInUserReq);
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> forgotPassword(ForgotUserPasswordReq forgotUserPasswordReq);
  Future<Either> googleSignin();
  Future<Either> facebookSignin();
  Future<void> signOut();
}
