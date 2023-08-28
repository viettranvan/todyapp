part of 'conversation_bloc.dart';

// @immutable
// sealed class ConversationState {}

enum ConversationStatus { initial, loading, success, failure }

enum Showing { both, keyboard, sticker, none }

final class ConversationState {
  ConversationState({
    required this.showingStatus,
    required this.status,
    required this.isClosed,
  });
  final Showing showingStatus;
  final ConversationStatus status;
  final bool isClosed;

  ConversationState copyWith({
    ConversationStatus? status,
    Showing? showingStatus,
    bool? isClosed,
  }) =>
      ConversationState(
        showingStatus: showingStatus ?? this.showingStatus,
        status: status ?? this.status,
        isClosed: isClosed ?? this.isClosed,
      );
}
