import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/utils/index.dart';

enum PasswordLengthChecker {
  veryWeak(AppColors.errorDefault),
  weak(AppColors.yellowPrimary),
  medium(AppColors.brandPrimary),
  strong(AppColors.neutralGreen),
  ;

  final Color color;
  const PasswordLengthChecker(this.color);
}

class PasswordChecker extends StatelessWidget {
  PasswordChecker({
    super.key,
    required this.password,
  });

  final String password;
  final GlobalKey boxKey = GlobalKey();

  int get totalPoint {
    int result = 0;
    if (regexNumber.hasMatch(password)) result++;
    if (regexSpecial.hasMatch(password)) result++;
    if (regexLowerAndUpper.hasMatch(password)) result++;
    if (password.length >= 8) result++;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        TooltipPasswordChecker().show(
          context: context,
          boxKey: boxKey,
          password: password,
        );
      },
      child: SizedBox(
        key: boxKey,
        height: 8,
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          itemCount: PasswordLengthChecker.values.length,
        ),
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) =>
      const SizedBox(width: 4);

  Widget? itemBuilder(BuildContext context, int index) {
    return Container(
      width: (MediaQuery.sizeOf(context).width -
              24 * 2 -
              4 * (PasswordLengthChecker.values.length - 1)) /
          4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: (index + 1) <= totalPoint
            ? PasswordLengthChecker.values[index].color
            : AppColors.neutralLine,
      ),
    );
  }
}

class TooltipPasswordChecker {
  late OverlayEntry _entry;
  late Offset _position;

  void show({
    required BuildContext context,
    required GlobalKey boxKey,
    required String password,
  }) {
    _position = _getPosition(boxKey);
    _entry = OverlayEntry(builder: (context) {
      return _PasswordCheckerOverlayEntry(
        boxPosition: _position,
        dispose: dispose,
        password: password,
      );
    });
    return Overlay.of(context).insert(_entry);
  }

  void dispose() {
    _entry.remove();
  }

  Offset _getPosition(GlobalKey<State<StatefulWidget>> boxKey) {
    RenderBox renderBox =
        boxKey.currentContext?.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);

    return Offset(offset.dx, offset.dy + renderBox.size.height);
  }
}

class _PasswordCheckerOverlayEntry extends StatelessWidget {
  const _PasswordCheckerOverlayEntry({
    Key? key,
    required this.dispose,
    required this.boxPosition,
    required this.password,
  }) : super(key: key);

  final VoidCallback dispose;
  final Offset boxPosition;
  final String password;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      final double witdth =
          boxConstraints.maxWidth > 400 ? 400 : boxConstraints.maxWidth;
      return Material(
        color: Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: dispose,
          child: Stack(
            children: List<Widget>.generate(
                  3,
                  (index) => Positioned(
                    top: boxPosition.dy + index * (30 - (2 - index) * 10.0) / 2,
                    left: boxConstraints.maxWidth / 2 +
                        10 * (2 - index) -
                        (30 - (2 - index) * 10.0) / 2,
                    child: _CircleWidget(size: 30 - (2 - index) * 10.0),
                  ),
                ).toList() +
                [
                  Positioned(
                    top: boxPosition.dy + 40,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.thinkingCloud,
                          width: witdth,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.strings.yourPasswordMustBe,
                                style: AppTextStyles.mulishBoldTitle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _PasswordCheckerItem(
                                      status:
                                          regexLowerAndUpper.hasMatch(password),
                                      title: context.strings.lowerUpperCase,
                                    ),
                                    _PasswordCheckerItem(
                                      status: password.length >= 8,
                                      title: context.strings.min8characters,
                                    ),
                                    _PasswordCheckerItem(
                                      status: regexSpecial.hasMatch(password),
                                      title: context.strings.atLeastSpecial,
                                    ),
                                    _PasswordCheckerItem(
                                      status: regexNumber.hasMatch(password),
                                      title: context.strings.atLeastNumber,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
          ),
        ),
      );
    });
  }
}

class _PasswordCheckerItem extends StatelessWidget {
  const _PasswordCheckerItem({required this.title, required this.status});

  final String title;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(status ? AppAssets.icSuccess : AppAssets.icError),
        const SizedBox(width: 4),
        Text(
          title,
          style: AppTextStyles.aBeeZeeRegular16,
        ),
      ],
    );
  }
}

class _CircleWidget extends StatelessWidget {
  const _CircleWidget({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black)),
    );
  }
}
