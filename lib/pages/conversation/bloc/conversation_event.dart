part of 'conversation_bloc.dart';

@immutable
sealed class ConversationEvent {}

final class SendTextMessage extends ConversationEvent {
  final UserProfile myProfile;
  final UserProfile partnerProfile;

  String get groupId {
    var myId = myProfile.id;
    var partnerId = partnerProfile.id;
    if (myId == null || partnerId == null) return '';

    if (myId.compareTo(partnerId) > 0) {
      return '$myId-$partnerId';
    } else {
      return '$partnerId-$myId';
    }
  }

  SendTextMessage({required this.myProfile, required this.partnerProfile});
}

final class ScrollToLastMessage extends ConversationEvent {}
