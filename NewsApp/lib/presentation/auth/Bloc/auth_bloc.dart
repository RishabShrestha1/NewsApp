import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp_self/data/models/auth/forgot_user_pass.dart';
import 'package:newsapp_self/domain/usecases/auth/facebook_signin.dart';
import 'package:newsapp_self/domain/usecases/auth/forgotpassword.dart';
import 'package:newsapp_self/domain/usecases/auth/google_signin.dart';
import 'package:newsapp_self/presentation/auth/Bloc/auth_event.dart';

import 'auth_state.dart';
import 'package:newsapp_self/domain/usecases/auth/signin.dart';
import 'package:newsapp_self/data/models/auth/signin_user_req.dart';
import 'package:newsapp_self/service_locator.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SigninUseCase signinUseCase = sl<SigninUseCase>();
  final GoogleSigninUsecase googleSigninUsecase = sl<GoogleSigninUsecase>();
  final FacebookSigninUsecase facebookSigninUsecase =
      sl<FacebookSigninUsecase>();

  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>(_onSignIn);
    on<ForgotPasswordEvent>(_forgotPassword);
    on<GoogleSignInEvent>(_ongooglesignin);
    on<FacebookSignInEvent>(_onfacebooksignin);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await signinUseCase.call(
      params: SigninUserReq(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthFailure(error: failure)),
      (success) => emit(AuthSuccess()),
    );
  }

  Future<void> _ongooglesignin(event, emit) async {
    emit(AuthLoading());
    final result = await googleSigninUsecase.call();
    result.fold(
      (failure) => emit(AuthFailure(error: failure)),
      (success) => emit(AuthSuccess()),
    );
  }

  Future<void> _onfacebooksignin(FacebookSignInEvent event, emit) async {
    // emit(AuthLoading());
    final result = await facebookSigninUsecase.call();
    result.fold(
      (failure) => emit(AuthFailure(error: failure)),
      (success) => emit(AuthSuccess()),
    );
  }

  Future<void> _forgotPassword(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await sl<ForgotpasswordUseCase>().call(
      params: ForgotUserPasswordReq(
        email: event.email,
      ),
    );
    result.fold(
      (failure) => emit(AuthFailure(error: failure)),
      (success) => emit(ForgotPasswordSuccess(message: success)),
    );
  }
}
