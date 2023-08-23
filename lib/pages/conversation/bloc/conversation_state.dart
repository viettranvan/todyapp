part of 'conversation_bloc.dart';

@immutable
sealed class ConversationState {}

final class ConversationInitial extends ConversationState {}

final class Success extends ConversationState {
  final bool hasScrollDown;

  Success({required this.hasScrollDown});
}

final class Failure extends ConversationState {
  final String errorMessage;

  Failure(this.errorMessage);
}
