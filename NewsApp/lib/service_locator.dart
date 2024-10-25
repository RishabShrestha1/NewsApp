import 'package:get_it/get_it.dart';
import 'package:newsapp_self/data/repository/auth/auth_repo_impl.dart';
import 'package:newsapp_self/data/sources/auth/auth_firebase_service.dart';
import 'package:newsapp_self/domain/repository/auth/auth_repo.dart';
import 'package:newsapp_self/domain/usecases/auth/facebook_signin.dart';
import 'package:newsapp_self/domain/usecases/auth/forgotpassword.dart';
import 'package:newsapp_self/domain/usecases/auth/google_signin.dart';
import 'package:newsapp_self/domain/usecases/auth/signin.dart';
import 'package:newsapp_self/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImp(),
  );
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );
  sl.registerSingleton<ForgotpasswordUseCase>(
    ForgotpasswordUseCase(),
  );
  sl.registerSingleton<GoogleSigninUsecase>(
    GoogleSigninUsecase(),
  );
  sl.registerSingleton<FacebookSigninUsecase>(
    FacebookSigninUsecase(),
  );
}
