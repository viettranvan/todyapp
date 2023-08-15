import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/pages/reset_password/reset_password_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<SubmibRequest>(_onSubmitRequest);
  }

  final TextEditingController newPasswordsController = TextEditingController();
  final TextEditingController confirmPasswordsController =
      TextEditingController();
  final ResetPasswordRepository repository = ResetPasswordRepository();

  FutureOr<void> _onSubmitRequest(
      SubmibRequest event, Emitter<ResetPasswordState> emit) async {
    try {
      emit(Loading());
      await repository.resetPassword(
        oobCode: event.oobCode,
        newPassword: newPasswordsController.text,
      );
      emit(Success());
    } catch (e) {
      emit(Failure(errorMessage: e.toString()));
    }
  }
}
