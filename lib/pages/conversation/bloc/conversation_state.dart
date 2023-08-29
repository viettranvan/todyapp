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
    required this.messageSelected,
  });
  final Showing showingStatus;
  final ConversationStatus status;
  final bool isClosed;
  final MessageChat? messageSelected;

  ConversationState copyWith({
    ConversationStatus? status,
    Showing? showingStatus,
    bool? isClosed,
    MessageChat? messageSelected,
  }) =>
      ConversationState(
        showingStatus: showingStatus ?? this.showingStatus,
        status: status ?? this.status,
        isClosed: isClosed ?? this.isClosed,
        messageSelected: messageSelected,
      );
}
