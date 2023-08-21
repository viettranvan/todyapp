// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todyapp/components/index.dart';
import 'package:todyapp/utils/index.dart';

class ChangeImageBottomSheet {
  static show({
    required BuildContext context,
    required Function(File)? updateAvatar,
  }) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BottomsheetWrap(
            title: context.strings.changeImage,
            child: ChangeImageView(
              updateAvatar: updateAvatar,
            ),
          );
        });
  }
}

class ChangeImageView extends StatelessWidget {
  const ChangeImageView({
    super.key,
    required this.updateAvatar,
  });

  final Function(File)? updateAvatar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _ActionItem(
                icPath: AppAssets.icCamera,
                title: context.strings.camera,
                onTap: () => _getFromCamera(context),
              ),
            ),
            Expanded(
              child: _ActionItem(
                icPath: AppAssets.icImage,
                title: context.strings.gallery,
                onTap: () => _getFromGallery(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
      ],
    );
  }

  Future<File?> _getFromCamera(BuildContext context) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        //Hide Bottomshet
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        updateAvatar?.call(file);
      }
    } catch (e) {
      if (e is PlatformException) {
        var errorMessage = e.message;
        if (e.code == 'camera_access_denied') {
          errorMessage =
              'Tody need access to your camera. Please turn on camera in app settings.';
        }
        ErrorDialog.show(context: context, content: errorMessage);
      }
    }
    return null;
  }

  Future<File?> _getFromGallery(BuildContext context) async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        //Hide Bottomshet
        if (context.mounted) {
          Navigator.of(context).pop();
        }

        updateAvatar?.call(file);
      }
    } catch (e) {
      if (e is PlatformException) {
        var errorMessage = e.message;
        if (e.code == 'camera_access_denied') {
          errorMessage =
              'Tody need access to your camera. Please turn on camera in app settings.';
        }
        ErrorDialog.show(context: context, content: errorMessage);
      }
    }
    return null;
  }
}

class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.title,
    required this.icPath,
    required this.onTap,
  });

  final String title;
  final String icPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyBackground,
            ),
            child: Center(
              child: SvgPicture.asset(icPath),
            ),
          ),
          const SizedBox(height: 6),
          Text(title, style: AppTextStyles.aBeeZeeRegular16)
        ],
      ),
    );
  }
}
