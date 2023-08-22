import 'package:flutter/material.dart';
import 'package:todyapp/pages/chats/widgets/index.dart';
import 'package:todyapp/utils/index.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder,
        itemCount: 10,
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          const UserAvatar(
            avatar: fakeUrl,
          ),
          Expanded(
            child: Text(
              'Name very long',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.aBeeZeeRegular12.copyWith(
                height: 0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) =>
      const SizedBox(width: 10);
}
