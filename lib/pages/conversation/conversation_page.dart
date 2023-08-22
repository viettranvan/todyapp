import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/conversation/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 24,
        title: const Row(
          children: [
            AvatarImage(
              imageUrl: fakeUrl,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: AppTextStyles.mulishSubHeading02,
                ),
                Text('Active now', style: AppTextStyles.aBeeZeeRegular12),
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
            Center(child: SvgPicture.asset(AppAssets.icSendMessage)),
          ],
        ),
      ),
      body: ListView(
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
