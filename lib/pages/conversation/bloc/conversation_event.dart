part of 'conversation_bloc.dart';

@immutable
sealed class ConversationEvent {}

final class InitialConversation extends ConversationEvent {
  final UserProfile myProfile;
  final UserProfile partnerProfile;

  InitialConversation({required this.myProfile, required this.partnerProfile});
}

final class SendTextMessage extends ConversationEvent {
  final String? stickerPath;

  SendTextMessage({
    this.stickerPath,
  });
}

final class ScrollToLastMessage extends ConversationEvent {}

final class HandleFocus extends ConversationEvent {}

final class HideKeyboardAndSticker extends ConversationEvent {}

final class ShowMessageDetail extends ConversationEvent {
  final MessageChat messageChat;

  ShowMessageDetail({required this.messageChat});
}
