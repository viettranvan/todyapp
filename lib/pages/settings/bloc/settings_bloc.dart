import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:todyapp/apis/api_client/index.dart';
import 'package:todyapp/models/index.dart';
import 'package:todyapp/pages/settings/settings_repository.dart';
import 'package:todyapp/utils/index.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<GetUserProfile>(_onGetUserProfile);
    on<RequestLogOut>(_onLogOut);
    on<ChangePassword>(_onChangePassword);
    on<UpdateAvatar>(_onUpdateAvatar);
  }

  final SettingsRepository repository = SettingsRepository();
  final Reference _storageReference = FirebaseStorage.instance.ref("/avatar");

  FutureOr<void> _onGetUserProfile(
      GetUserProfile event, Emitter<SettingsState> emit) async {
    try {
      emit(Loading());

      var res = await repository.getUserProfile();

      emit(ProfileSuccess(user: res));
    } on ApiResponse catch (e) {
      if (e.status == Status.error) {
        emit(Failure(e.error.toString()));
      }
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }

  FutureOr<void> _onLogOut(
      RequestLogOut event, Emitter<SettingsState> emit) async {
    emit(Loading());
    await locator<AppStorage>().setValue(AppStorageKey.idToken, null);
    await locator<AppStorage>().setValue(AppStorageKey.refreshToken, null);
    emit(UpdateSuccess(type: SuccessType.logOut));
  }

  FutureOr<void> _onChangePassword(
      ChangePassword event, Emitter<SettingsState> emit) async {
    try {
      emit(Loading());
      var lct = locator<AppStorage>();
      var email = await lct.getValue(AppStorageKey.email);
      var user = await repository.signIn(
          email: email ?? '', password: event.currentPassword);
      if (user.idToken != null) {
        var auth = await repository.changePassword(
            idToken: user.idToken!, newPassword: event.newPassword);
        lct.setValue(AppStorageKey.idToken, auth.idToken);
        lct.setValue(AppStorageKey.refreshToken, auth.refreshToken);
      }
      emit(UpdateSuccess(type: SuccessType.changePassword));
    } on ApiResponse catch (e) {
      if (e.status == Status.error) {
        emit(Failure(e.error.toString()));
      }
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }

  FutureOr<void> _onUpdateAvatar(
      UpdateAvatar event, Emitter<SettingsState> emit) async {
    try {
      emit(Loading());

      // delete avatar in firebase storage if it exists
      await _deleteUrlImage(event.currentAavatar);

      // get new url image from file path
      String url = await _getUrlImage(event.newAvatar);

      //  update avatar
      await repository.updateAvatar(photoUrl: url);

      // Get new profile information after update
      add(GetUserProfile());
      emit(UpdateSuccess(type: SuccessType.changeImage));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }

  Future<String> _getUrlImage(String? imagePath) async {
    String filename = basename(imagePath ?? "");
    final UploadTask uploadTask =
        _storageReference.child(filename).putFile(File(imagePath!));
    final TaskSnapshot downloadUrl = (await uploadTask);
    final String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }

  Future<void> _deleteUrlImage(String? filePath) async {
    if (filePath == null) return;

    final decoded = Uri.decodeFull(filePath);
    var storage =
        const String.fromEnvironment('FirebaseStorage', defaultValue: '');
    if (decoded.contains(storage)) {
      var avatarStorage = '${storage}avatar/';
      String fileNamePath =
          decoded.substring(avatarStorage.length, decoded.length);
      final fileName = fileNamePath.split('?').firstOrNull;
      if (fileName != null) {
        await _storageReference.child(fileName).delete();
      }
    }
  }
}
