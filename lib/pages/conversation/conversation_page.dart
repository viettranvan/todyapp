import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/models/index.dart';
import 'package:todyapp/pages/conversation/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key, required this.partnerUser});

  final UserProfile partnerUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 24,
        title: Row(
          children: [
            AvatarImage(
              imageUrl: partnerUser.photoUrl ?? '',
              name: partnerUser.displayName ?? '',
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  partnerUser.displayName ?? '',
                  style: AppTextStyles.mulishSubHeading02,
                ),
                const Text('Active now', style: AppTextStyles.aBeeZeeRegular12),
              ],
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(AppAssets.icCall),
          const SizedBox(width: 10),
          SvgPicture.asset(AppAssets.icVideo),
          const SizedBox(width: 10),
        ],
      ),
      bottomSheet: Container(
        height: 60,
        color: AppColors.greyBackground,
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: SvgPicture.asset(AppAssets.archiveIcon)),
            const SizedBox(width: 6),
            Expanded(
              child: ChatTextField(
                controller: TextEditingController(),
              ),
            ),
            const SizedBox(width: 6),
            GestureDetector(
              onTap: () {
                DocumentReference documentReference = FirebaseFirestore.instance
                    .collection("messages")
                    .doc("1-3")
                    .collection("1-3")
                    .doc(DateTime.now().millisecondsSinceEpoch.toString());

                MessageChat messageChat = MessageChat(
                  idFrom: "1",
                  idTo: "2",
                  timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
                  content: "content",
                  type: 0,
                );

                FirebaseFirestore.instance.runTransaction((transaction) async {
                  transaction.set(
                    documentReference,
                    messageChat.toJson(),
                  );
                });
              },
              child: Center(
                child: SvgPicture.asset(AppAssets.icSendMessage),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("messages")
            .doc("1-3")
            .collection("1-3")
            .orderBy('timestamp', descending: true)
            .limit(20)
            .snapshots(),
        builder: (context, snapshot) {
          return ListView(
            children: const [
              MessageBubble.first(
                userImage: fakeUrl,
                username: 'username',
                message: 'message',
                isMe: true,
              ),
              MessageBubble.next(
                message: 'message',
                isMe: true,
              ),
              MessageBubble.next(
                message: 'message',
                isMe: true,
              ),
              MessageBubble.first(
                userImage: fakeUrl,
                username: 'username',
                message: 'message',
                isMe: false,
              ),
              MessageBubble.next(
                message: 'message',
                isMe: false,
              ),
              MessageBubble.next(
                message: 'message',
                isMe: false,
              ),
            ],
          );
        },
      ),
    );
  }
}

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.neutralWhite,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        style: AppTextStyles.aBeeZeeRegular16,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.neutralWhite,
          hintText: context.strings.search,
          contentPadding: EdgeInsets.zero,
          hintStyle: AppTextStyles.aBeeZeeRegular16
              .copyWith(color: AppColors.neutralGhost),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SvgPicture.asset(
              AppAssets.icSearch,
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                  AppColors.textBlackSecondary, BlendMode.srcIn),
            ),
          ),
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
        ),
      ),
    );
  }
}

class MessageChat {
  final String idFrom;
  final String idTo;
  final String timestamp;
  final String content;
  final int type;

  const MessageChat({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "idFrom": idFrom,
      "idTo": idTo,
      "timestamp": timestamp,
      "content": content,
      "type": type,
    };
  }

  factory MessageChat.fromDocument(DocumentSnapshot doc) {
    String idFrom = doc.get("idFrom");
    String idTo = doc.get("idTo");
    String timestamp = doc.get("timestamp");
    String content = doc.get("content");
    int type = doc.get("type");
    return MessageChat(
        idFrom: idFrom,
        idTo: idTo,
        timestamp: timestamp,
        content: content,
        type: type);
  }
}
