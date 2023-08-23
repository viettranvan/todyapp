import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/apis/api_client/api_response.dart';
import 'package:todyapp/pages/login/login_repository.dart';
import 'package:todyapp/utils/index.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SendLoginRequest>(_onSendLoginRequest);
    on<GoogleLoginRequest>(_onGoogleLogin);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginRepository repository = LoginRepository();

  FutureOr<void> _onSendLoginRequest(
      SendLoginRequest event, Emitter<LoginState> emit) async {
    try {
      emit(Loading());
      var resposne = await repository.signIn(
          email: emailController.text, password: passwordController.text);

      await locator<AppStorage>().setValue(AppStorageKey.email, resposne.email);
      await locator<AppStorage>().setValue(AppStorageKey.uid, resposne.localId);
      await locator<AppStorage>()
          .setValue(AppStorageKey.idToken, resposne.idToken);
      await locator<AppStorage>()
          .setValue(AppStorageKey.refreshToken, resposne.refreshToken);

      emit(Success());
    } on ApiResponse catch (e) {
      if (e.status == Status.error) {
        emit(Failure(e.error.toString()));
      }
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }

  FutureOr<void> _onGoogleLogin(
      GoogleLoginRequest event, Emitter<LoginState> emit) async {
    try {
      emit(Loading());

      var response = await repository.signInWithGoogle();

      if (response == null) emit(Failure("Something went wrong"));
      await locator<AppStorage>()
          .setValue(AppStorageKey.email, response!.email);
      await locator<AppStorage>().setValue(AppStorageKey.uid, response.localId);
      await locator<AppStorage>()
          .setValue(AppStorageKey.idToken, response.idToken);
      await locator<AppStorage>()
          .setValue(AppStorageKey.refreshToken, response.refreshToken);

      emit(Success());
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}
