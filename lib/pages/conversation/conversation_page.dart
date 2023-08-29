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

  final UserProfile myProfile;
  final UserProfile partnerProfile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConversationBloc()
        ..add(InitialConversation(
          myProfile: myProfile,
          partnerProfile: partnerProfile,
        )),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              child: BlocBuilder<ConversationBloc, ConversationState>(
                  builder: (context, state) {
                if (state.status == ConversationStatus.initial) {
                  return const SizedBox();
                }
                return GestureDetector(
                  onTap: () {
                    context
                        .read<ConversationBloc>()
                        .add(HideKeyboardAndSticker());
                  },
                  child: StreamBuilder<QuerySnapshot>(
                    stream: context.read<ConversationBloc>().chatStream(),
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
                  ),
                );
              }),
            ),
            BlocBuilder<ConversationBloc, ConversationState>(
              builder: (context, state) {
                var bloc = context.read<ConversationBloc>();
                return InputSection(
                  focusNode: bloc.focusNode,
                  controller: bloc.chatController,
                  onSubmitted: (value) => bloc.add(HideKeyboardAndSticker()),
                  onTap: () =>
                      bloc.focusNode.hasFocus ? () {} : bloc.add(HandleFocus()),
                  onTapEmoji: () => bloc.add(HandleFocus()),
                  onSendMessage: () => bloc.add(SendTextMessage()),
                );
              },
            ),
            BlocBuilder<ConversationBloc, ConversationState>(
              builder: (context, state) {
                return StickerBuilder(
                  sendSticker: (stickerPath) => context
                      .read<ConversationBloc>()
                      .add(SendTextMessage(stickerPath: stickerPath)),
                  isClosed: state.isClosed,
                  showingStatus: state.showingStatus,
                  // hideKeyboard: state.showSticker,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  itemChatBuilder(BuildContext context, int index, List<MessageChat> messages) {
    var bloc = context.read<ConversationBloc>();
    return ChatItem(
        messages: messages,
        index: index,
        myProfile: myProfile,
        partnerProfile: partnerProfile,
        showDetail: bloc.state.messageSelected == messages[index],
        onTapMessage: () =>
            bloc.add(ShowMessageDetail(messageChat: messages[index])));
  }
}
