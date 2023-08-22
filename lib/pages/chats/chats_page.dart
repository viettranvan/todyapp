import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

import 'views/index.dart';
import 'widgets/index.dart';

@RoutePage()
class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: AvatarImage(
            imageUrl: fakeUrl,
            // size: ,
          ),
        ),
        centerTitle: true,
        title: const Text('Chats'),
        actions: [
          SvgPicture.asset(AppAssets.icWrite),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            SearchTextField(
              controller: TextEditingController(),
              onSubmitted: (value) {},
            ),
            const SizedBox(height: 20),
            const StorySection(),
            const SizedBox(height: 20),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: itemBuilder,
              separatorBuilder: separatorBuilder,
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        context.router.push(const ConversationRoute());
      },
      child: const Row(
        children: [
          UserAvatar(),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: AppTextStyles.mulishSubHeading02,
              ),
              Text('Last message', style: AppTextStyles.aBeeZeeRegular12),
            ],
          ),
        ],
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) =>
      const SizedBox(height: 10);
}
