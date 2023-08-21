part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

class RequestLogOut extends SettingsEvent {}

class GetUserProfile extends SettingsEvent {}

class ChangePassword extends SettingsEvent {
  final String currentPassword;
  final String newPassword;

  ChangePassword({required this.currentPassword, required this.newPassword});
}

class UpdateAvatar extends SettingsEvent {
  final String? currentAavatar;
  final String newAvatar;

  UpdateAvatar({
    required this.currentAavatar,
    required this.newAvatar,
  });
}
