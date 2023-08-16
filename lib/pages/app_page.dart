import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/router/router.gr.dart';
import 'package:todyapp/utils/index.dart';

@RoutePage()
class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeTabRoute(),
        ChatsTabRoute(),
        ArtifactRoute(),
        SettingsRoute(),
      ],
      homeIndex: 0,
      builder: (context, child) => Scaffold(
        body: child,
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final hidesBottomBarWhenPushed =
        context.tabsRouter.topMatch.meta['hidesBottomBarWhenPushed'] == true;
    return AnimatedOpacity(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      opacity: hidesBottomBarWhenPushed ? 0 : 1,
      child: Container(
        height: 70 + MediaQuery.paddingOf(context).bottom,
        padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 15,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
          ],
        ),
        child: MainNavigationBar(
          tabIndex: context.tabsRouter.activeIndex,
          onChangeTab: (tabIndex) {
            if (hidesBottomBarWhenPushed) return;
            if (context.tabsRouter.activeIndex == tabIndex) {
              context.tabsRouter.stackRouterOfIndex(tabIndex)?.popUntilRoot();
            } else {
              context.tabsRouter.setActiveIndex(tabIndex);
            }
          },
        ),
      ),
    );
  }
}

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
    required this.tabIndex,
    required this.onChangeTab,
  });

  final int tabIndex;
  final Function(int) onChangeTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MainTab(
          onTap: () => onChangeTab(0),
          assetPath: AppAssets.icHome,
          title: context.strings.home,
          isActive: tabIndex == 0,
        ),
        MainTab(
          onTap: () => onChangeTab(1),
          assetPath: AppAssets.chatsIcon,
          title: context.strings.chats,
          isActive: tabIndex == 1,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: AppColors.brandSecondary,
            shape: BoxShape.circle,
          ),
          child: const Center(
              child: Text(
            '+',
            style: TextStyle(color: AppColors.neutralWhite, fontSize: 25),
          )),
        ),
        MainTab(
          onTap: () => onChangeTab(2),
          assetPath: AppAssets.callsIcon,
          title: context.strings.editor,
          isActive: tabIndex == 2,
        ),
        MainTab(
          onTap: () => onChangeTab(3),
          assetPath: AppAssets.settingsIcon,
          title: context.strings.settings,
          isActive: tabIndex == 3,
        ),
      ],
    );
  }
}

class MainTab extends StatelessWidget {
  const MainTab({
    super.key,
    required this.onTap,
    required this.assetPath,
    required this.title,
    this.isActive = false,
  });

  final String assetPath;
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(
                isActive ? AppColors.brandPrimary : AppColors.neutralBlack,
                BlendMode.srcIn),
          ),
          Text(
            title,
            style: AppTextStyles.aBeeZeeRegular12.copyWith(
              color: isActive ? AppColors.brandPrimary : AppColors.neutralBlack,
            ),
          )
        ],
      ),
    );
  }
}
