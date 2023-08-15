part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class Loading extends ResetPasswordState {}

final class Success extends ResetPasswordState {}

final class Failure extends ResetPasswordState {
  final String errorMessage;

  Failure({required this.errorMessage});
}
