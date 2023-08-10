part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {
  final bool checkBox;
  const SignUpState(this.checkBox);
}

final class SignUpInitial extends SignUpState {
  const SignUpInitial() : super(false);
}

final class SignUpLoading extends SignUpState {
  const SignUpLoading(super.checkBox);
}

final class SignUpChange extends SignUpState {
  const SignUpChange(super.checkBox);
}

final class SignUpSuccess extends SignUpState {
  const SignUpSuccess(super.checkBox);
}

final class SignUpFailure extends SignUpState {
  final String errorMessage;
  const SignUpFailure(super.checkBox, this.errorMessage);
}
