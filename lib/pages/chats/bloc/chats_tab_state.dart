part of 'chats_tab_bloc.dart';

@immutable
sealed class ChatsTabState {}

final class ChatsTabInitial extends ChatsTabState {}

final class Loading extends ChatsTabState {}

final class Success extends ChatsTabState {
  final List<UserProfile> listUsers;

  Success({required this.listUsers});
}

final class Failure extends ChatsTabState {
  final String errorMessage;

  Failure(this.errorMessage);
}
