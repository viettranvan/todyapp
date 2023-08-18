part of 'settings_bloc.dart';

enum SuccessType { changePassword, changeImage }

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class Loading extends SettingsState {}

final class Success extends SettingsState {
  final SuccessType type;

  Success(this.type);
}

final class LogOutSuccess extends SettingsState {}

final class Failure extends SettingsState {
  final String errorMessage;

  Failure(this.errorMessage);
}
