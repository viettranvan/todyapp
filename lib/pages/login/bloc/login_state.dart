part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class Loading extends LoginState {}

final class Success extends LoginState {}

final class Failure extends LoginState {
  final String errorMessage;
  Failure(this.errorMessage);
}
