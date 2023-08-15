import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/pages/sign_up/sign_up_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpInitial()) {
    on<UpdateCheckBox>(_onUpdateCheckBox);
    on<RequestSignUp>(_onRequestSignUp);
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  FutureOr<void> _onUpdateCheckBox(
      UpdateCheckBox event, Emitter<SignUpState> emit) {
    emit(SignUpChange(!state.checkBox));
  }

  FutureOr<void> _onRequestSignUp(
      RequestSignUp event, Emitter<SignUpState> emit) async {
    try {
      emit(SignUpLoading(state.checkBox));
      await SignUpRepository.createNewAccount(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(SignUpSuccess(state.checkBox));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(
            state.checkBox, 'The account already exists for that email'));
      }
    } catch (e) {
      emit(SignUpFailure(state.checkBox, e.toString()));
    }
  }
}
