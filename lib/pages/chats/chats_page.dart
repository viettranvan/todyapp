import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/pages/chats/bloc/chats_tab_bloc.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

import 'views/index.dart';
import 'widgets/index.dart';

@RoutePage()
class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsTabBloc()..add(GetAllFriends()),
      child: BlocListener<ChatsTabBloc, ChatsTabState>(
        listener: _listener,
        child: Scaffold(
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
                BlocBuilder<ChatsTabBloc, ChatsTabState>(
                  buildWhen: (previous, current) => current is Success,
                  builder: (context, state) {
                    if (state is Success) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: itemBuilder,
                        separatorBuilder: separatorBuilder,
                        itemCount: state.listUsers.length,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    var state = context.read<ChatsTabBloc>().state;

    if (state is! Success) return const SizedBox();
    var item = state.listUsers[index];

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.router.push(ConversationRoute(partnerUser: item));
      },
      child: Row(
        children: [
          UserAvatar(
            avatar: item.photoUrl ?? '',
            displayName: item.displayName,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.displayName ?? '',
                style: AppTextStyles.mulishSubHeading02,
              ),
              Visibility(
                visible: (item.lastMessage ?? '').isNotEmpty,
                child: Text(item.lastMessage ?? '',
                    style: AppTextStyles.aBeeZeeRegular12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) =>
      const SizedBox(height: 10);

  void _listener(BuildContext context, ChatsTabState state) {
    switch (state.runtimeType) {
      case Loading:
        EasyLoading.show();
        break;
      case Failure:
        EasyLoading.dismiss();
        ErrorDialog.show(
            context: context, content: (state as Failure).errorMessage);
        break;
      case Success:
        EasyLoading.dismiss();

        break;

      default:
        EasyLoading.dismiss();
        break;
    }
  }
}
