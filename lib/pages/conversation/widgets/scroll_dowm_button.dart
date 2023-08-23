import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/utils/index.dart';

class ScrollDownButton extends StatefulWidget {
  const ScrollDownButton({
    Key? key,
    required this.scrollController,
    required this.onScrollDown,
  }) : super(key: key);

  final ScrollController scrollController;
  final VoidCallback onScrollDown;

  @override
  State<ScrollDownButton> createState() => _ScrollDownButtonState();
}

class _ScrollDownButtonState extends State<ScrollDownButton> {
  bool visible = false;
  @override
  void initState() {
    widget.scrollController.addListener(() {
      setState(() {
        if (widget.scrollController.offset >= 400) {
          visible = true;
        } else {
          visible = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: GestureDetector(
        onTap: widget.onScrollDown,
        child: Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
            color: AppColors.textBlue,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              AppAssets.icScrollDown,
              height: 30,
            ),
          ),
        ),
      ),
    );
  }
}
