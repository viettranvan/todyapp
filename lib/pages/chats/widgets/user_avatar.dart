import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(fakeUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 2,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.textGrey60,
            ),
            padding: const EdgeInsets.all(2),
            child: Text(
              '4 minutes',
              style: AppTextStyles.aBeeZeeItalic10
                  .copyWith(color: AppColors.neutralWhite),
            ),
          ),
        ),
        Positioned(
          bottom: 2,
          right: 0,
          child: Container(
            height: 14,
            width: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.neutralGreen,
              border: Border.all(width: 2, color: AppColors.neutralBlack),
            ),
          ),
        ),
      ],
    );
  }
}
