part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class RequestSignUp extends SignUpEvent {}

class UpdateCheckBox extends SignUpEvent {}
