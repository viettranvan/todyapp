import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todyapp/models/message_chat/index.dart';
import 'package:todyapp/models/user_profile/index.dart';
import 'package:todyapp/pages/conversation/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.messages,
    required this.index,
    required this.myProfile,
    required this.partnerProfile,
    required this.onTapMessage,
    required this.showDetail,
  });

  final List<MessageChat> messages;
  final int index;
  final UserProfile myProfile;
  final UserProfile partnerProfile;
  final VoidCallback onTapMessage;
  final bool showDetail;

  bool get isMe => messages[index].idFrom == myProfile.id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: showMessgaDateTime(messages, index),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _renderTime(context, messages[index].timestamp),
              style: AppTextStyles.aBeeZeeRegular16,
            ),
          ),
        ),
        showNextBubbleMessage(messages, index)
            ? MessageBubble.next(
                message: messages[index].content,
                isMe: isMe,
                sendingTime: _renderTime(context, messages[index].timestamp),
                contentType: messages[index].type.getContentType,
                onTapMessage: onTapMessage,
                showDetail: showDetail,
              )
            : MessageBubble.first(
                sendingTime: _renderTime(context, messages[index].timestamp),
                showDetail: showDetail,
                userImage: isMe ? myProfile.photoUrl : partnerProfile.photoUrl,
                username:
                    isMe ? context.strings.you : partnerProfile.displayName,
                message: messages[index].content,
                isMe: isMe,
                onTapMessage: onTapMessage,
                contentType: messages[index].type.getContentType,
              ),
      ],
    );
  }

  bool showMessgaDateTime(List<MessageChat> messages, int index) {
    if (index == messages.length - 1) return true;

    if (index < messages.length - 1) {
      // because of list is reversed so previous item must be index + 1
      var currentTimestamp = messages[index].timestamp.toDate();
      var previousTimestamp = messages[index + 1].timestamp.toDate();
      int inMinute = currentTimestamp.difference(previousTimestamp).inMinutes;

      return inMinute > 60;
    }
    return false;
  }

  bool showNextBubbleMessage(List<MessageChat> messages, int index) {
    if (index == messages.length) return false;

    if (index < messages.length - 1) {
      // because of list is reversed so previous item must be index + 1
      var currentIdFrom = messages[index].idFrom;
      var previousIdFrom = messages[index + 1].idFrom;
      var currentTimestamp = messages[index].timestamp.toDate();
      var previousTimestamp = messages[index + 1].timestamp.toDate();

      int inMinute = currentTimestamp.difference(previousTimestamp).inMinutes;

      return inMinute < 5 && currentIdFrom == previousIdFrom;
    }
    return false;
  }

  String _renderTime(BuildContext context, Timestamp timestamp) {
    var date = timestamp.toDate();
    var now = DateTime.now();

    var time = DateFormat('HH:mm').format(date);

    String? countryCode = Localizations.localeOf(context).toString();

    String dateFormat(String pattern) =>
        DateFormat(pattern, countryCode).format(date);

    final int inDays = now.difference(date).inDays;
    if (date.year == now.year) {
      if (inDays < now.weekday) {
        return '${dateFormat('EEE')}, $time';
      } else {
        return '$time, ${dateFormat('EEE')},${dateFormat('dd MMM')}';
      }
    } else {
      return '$time, ${dateFormat('EEE')}, ${dateFormat('dd MMM')}, ${date.year}';
    }
  }
}
