import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/apis/api_client/index.dart';
import 'package:todyapp/pages/forgot_password/forgor_password_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>(_onSendRequest);
  }

  final TextEditingController emailController = TextEditingController();

  FutureOr<void> _onSendRequest(
      ForgotPasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    try {
      emit(ForgotPasswordLoading());
      await ForgotPasswordRepository()
          .sendEmailForgotPassword(email: emailController.text);
      emit(ForgotPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ForgotPasswordFailure('User not found'));
      }
    } on ApiResponse catch (e) {
      if (e.status == Status.error) {
        emit(ForgotPasswordFailure(e.error.toString()));
      }
    } catch (e) {
      emit(ForgotPasswordFailure(e.toString()));
    }
  }
}
