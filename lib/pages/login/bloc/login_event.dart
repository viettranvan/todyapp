part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class SendLoginRequest extends LoginEvent {}

final class GoogleLoginRequest extends LoginEvent {}
