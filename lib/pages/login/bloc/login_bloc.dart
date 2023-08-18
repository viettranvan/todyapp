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
}
