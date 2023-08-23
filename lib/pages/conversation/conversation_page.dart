import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todyapp/models/index.dart';
import 'package:todyapp/pages/conversation/views/index.dart';
import 'package:todyapp/pages/conversation/widgets/index.dart';

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
                          controller:
                              context.read<ConversationBloc>().scrollController,
                          padding: const EdgeInsets.all(16),
                          itemCount: messages.length,
                          shrinkWrap: true,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return MessageBubble.first(
                              userImage:
                                  (messages[index].idFrom == myProfile.id)
                                      ? myProfile.photoUrl
                                      : partnerProfile.photoUrl,
                              username: (messages[index].idFrom == myProfile.id)
                                  ? myProfile.displayName
                                  : partnerProfile.displayName,
                              message: messages[index].content,
                              isMe: messages[index].idFrom == myProfile.id,
                            );
                          },
                        );
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
}
