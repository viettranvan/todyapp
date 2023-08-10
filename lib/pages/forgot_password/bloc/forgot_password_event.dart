part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

class SendRequest extends ForgotPasswordEvent {}
