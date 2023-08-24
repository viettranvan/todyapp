import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todyapp/models/index.dart';
import 'package:todyapp/pages/conversation/views/index.dart';
import 'package:todyapp/pages/conversation/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

import 'bloc/conversation_bloc.dart';

@RoutePage()
class ConversationPage extends StatelessWidget {
  const ConversationPage({
    super.key,
    required this.partnerProfile,
    required this.myProfile,
  });

  final UserProfile partnerProfile;
  final UserProfile myProfile;

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConversationBloc(),
      child: Scaffold(
        appBar: ConversationAppBar(partnerProfile: partnerProfile),
        floatingActionButton: Builder(
          builder: (context) {
            var bloc = context.read<ConversationBloc>();
            return ScrollDownButton(
              scrollController: bloc.scrollController,
              onScrollDown: () => bloc.add(ScrollToLastMessage()),
            );
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: Builder(builder: (context) {
                return StreamBuilder<QuerySnapshot>(
                  stream: context
                      .read<ConversationBloc>()
                      .chatStream(groupId: groupId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.docs.isNotEmpty) {
                        List<MessageChat> messages = [];
                        for (var item in snapshot.data!.docs) {
                          messages.add(MessageChat.fromDocument(item));
                        }
                        return ListView.builder(
                            controller: context
                                .read<ConversationBloc>()
                                .scrollController,
                            padding: const EdgeInsets.all(16),
                            itemCount: messages.length,
                            shrinkWrap: true,
                            reverse: true,
                            itemBuilder: (_, index) =>
                                itemChatBuilder(context, index, messages));
                      }
                    }
                    return const FlutterLogo();
                  },
                );
              }),
            ),
            BlocBuilder<ConversationBloc, ConversationState>(
              builder: (context, state) {
                var bloc = context.read<ConversationBloc>();
                return InputSection(
                  controller: bloc.chatController,
                  onSendMessage: () => bloc.add(SendTextMessage(
                    myProfile: myProfile,
                    partnerProfile: partnerProfile,
                  )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  itemChatBuilder(BuildContext context, int index, List<MessageChat> messages) {
    bool isMe() => messages[index].idFrom == myProfile.id;

    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          // showMessgaDateTime()

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
                  message: messages[index].content, isMe: isMe())
              : MessageBubble.first(
                  userImage:
                      isMe() ? myProfile.photoUrl : partnerProfile.photoUrl,
                  username: isMe()
                      ? myProfile.displayName
                      : partnerProfile.displayName,
                  message: messages[index].content,
                  isMe: isMe(),
                ),
        ],
      ),
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
