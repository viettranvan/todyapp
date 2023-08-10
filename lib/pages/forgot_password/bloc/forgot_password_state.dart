part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordFailure(this.errorMessage);
}
