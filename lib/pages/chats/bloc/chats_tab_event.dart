part of 'chats_tab_bloc.dart';

@immutable
sealed class ChatsTabEvent {}

final class GetAllFriends extends ChatsTabEvent {}
