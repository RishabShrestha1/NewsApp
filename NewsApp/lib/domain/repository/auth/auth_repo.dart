import 'package:dartz/dartz.dart';
import 'package:newsapp_self/data/models/auth/create_user_req.dart';

abstract class AuthRepository {
  Future<void> signIn(CreateUserReq createUserReq);
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<void> signOut();
}
