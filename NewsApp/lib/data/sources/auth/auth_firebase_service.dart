import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapp_self/data/models/auth/create_user_req.dart';
import 'package:newsapp_self/data/models/auth/forgot_user_pass.dart';
import 'package:newsapp_self/data/models/auth/signin_user_req.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SigninUserReq signInReq);
  Future<Either> signUp(CreateUserReq createUserReq);
  Future<Either> forgotPassword(ForgotUserPasswordReq forgotUserPasswordReq);
  Future<Either> googleSignIn();
  Future<Either> facebookSignIn();
  Future<void> signOut();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserReq signInUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInUserReq.email,
        password: signInUserReq.password,
      );
      return const Right('Sign up successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong credential for that user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      return const Right('Sign up successful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> forgotPassword(
      ForgotUserPasswordReq forgotUserPasswordReq) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: forgotUserPasswordReq.email,
      );
      return const Right('Email sent!');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      } else {
        message = e.message.toString();
      }
      return Left(message);
    }
  }

  @override
  Future<Either> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser =
          await googleSignIn.signIn(); // Proper call to Google Sign-In
      if (googleUser == null) {
        return const Left('Sign in aborted by user');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return const Right('Google Sign-in successful');
    } catch (e) {
      return Left('Google Sign-in failed: ${e.toString()}');
    }
  }

  @override
  Future<Either> facebookSignIn() async {
    try {
      log('Starting Facebook sign-in process', name: 'FacebookAuth');

      // Check if there's an existing Facebook session
      final AccessToken? existingToken =
          await FacebookAuth.instance.accessToken;
      if (existingToken != null) {
        log('Found existing Facebook session, logging out first',
            name: 'FacebookAuth');
        await FacebookAuth.instance.logOut();
      }

      // Attempt Facebook login
      log('Attempting Facebook login', name: 'FacebookAuth');
      final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
        loginBehavior: LoginBehavior.dialogOnly,
      );

      // Handle the login result
      switch (loginResult.status) {
        case LoginStatus.success:
          log('Facebook login successful', name: 'FacebookAuth');

          // Get access token
          final AccessToken? accessToken = loginResult.accessToken;
          if (accessToken == null) {
            log('Access token is null', name: 'FacebookAuth');
            return const Left('Failed to get Facebook access token');
          }

          // Create Firebase credential
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken.token);

          // Sign in to Firebase
          log('Signing in to Firebase with Facebook credential',
              name: 'FacebookAuth');
          final UserCredential userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);

          // Get user data
          final userData = await FacebookAuth.instance.getUserData();
          log('Got user data: ${userData.toString()}', name: 'FacebookAuth');

          return Right(userCredential);

        case LoginStatus.cancelled:
          log('Facebook login cancelled by user', name: 'FacebookAuth');
          return const Left('Facebook login was cancelled by user');

        case LoginStatus.failed:
          log('Facebook login failed: ${loginResult.message}',
              name: 'FacebookAuth');
          return Left('Facebook login failed: ${loginResult.message}');

        default:
          log('Unexpected Facebook login status: ${loginResult.status}',
              name: 'FacebookAuth');
          return Left(
              'Unexpected Facebook login status: ${loginResult.status}');
      }
    } catch (e, stackTrace) {
      log(
        'Facebook login error: $e',
        name: 'FacebookAuth',
        error: e,
        stackTrace: stackTrace,
      );
      return Left('Facebook login error: $e');
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
