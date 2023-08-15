part of 'reset_password_bloc.dart';

@immutable
sealed class ResetPasswordEvent {}

final class SubmibRequest extends ResetPasswordEvent {
  final String oobCode;

  SubmibRequest({required this.oobCode});
}
