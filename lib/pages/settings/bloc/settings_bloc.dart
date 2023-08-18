import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/apis/api_client/index.dart';
import 'package:todyapp/pages/settings/settings_repository.dart';
import 'package:todyapp/utils/index.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<RequestLogOut>(_onLogOut);
    on<ChangePassword>(_onChangePassword);
  }

  final SettingsRepository repository = SettingsRepository();

  FutureOr<void> _onLogOut(
      RequestLogOut event, Emitter<SettingsState> emit) async {
    emit(Loading());
    await locator<AppStorage>().setValue(AppStorageKey.idToken, null);
    await locator<AppStorage>().setValue(AppStorageKey.refreshToken, null);
    emit(LogOutSuccess());
  }

  FutureOr<void> _onChangePassword(
      ChangePassword event, Emitter<SettingsState> emit) async {
    try {
      emit(Loading());
      var email = await locator<AppStorage>().getValue(AppStorageKey.email);
      var user = await repository.signIn(
          email: email ?? '', password: event.currentPassword);
      if (user.idToken != null) {
        await repository.changePassword(
            idToken: user.idToken!, newPassword: event.newPassword);
      }
      emit(Success(SuccessType.changePassword));
    } on ApiResponse catch (e) {
      if (e.status == Status.error) {
        emit(Failure(e.error.toString()));
      }
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}
