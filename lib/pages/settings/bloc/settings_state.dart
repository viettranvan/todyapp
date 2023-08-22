part of 'settings_bloc.dart';

enum SuccessType { changePassword, changeImage, logOut }

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class Loading extends SettingsState {}

final class ProfileSuccess extends SettingsState {
  final UserProfile user;

  ProfileSuccess({required this.user});
}

class UpdateSuccess extends SettingsState {
  final SuccessType type;

  UpdateSuccess({required this.type});
}

final class Failure extends SettingsState {
  final String errorMessage;

  Failure(this.errorMessage);
}
