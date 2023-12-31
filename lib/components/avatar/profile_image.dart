import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todyapp/utils/index.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.imageUrl,
    this.size = 48,
    this.fit = BoxFit.cover,
    this.maxWidthDiskCache = 1024,
    this.maxHeightDiskCache = 1024,
    this.isLoading = false,
  });

  final double size;
  final String imageUrl;
  final BoxFit fit;
  final bool isLoading;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((size / 2)),
      ),
      child: Stack(
        children: [
          _getProfileImage(),
          Visibility(
            visible: isLoading,
            child: SizedBox(
              height: size,
              width: size,
              child: const CircularProgressIndicator(
                color: AppColors.bluePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getProfileImage() {
    switch (Uri.parse(imageUrl).isAbsolute) {
      case true:
        return ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular((size / 2)),
          ),
          child: CachedNetworkImage(
            key: ValueKey(imageUrl),
            imageUrl: imageUrl,
            placeholder: (context, url) => Container(
              color: Colors.black12,
            ),
            errorWidget: (context, url, error) {
              return defaultProfileWidget();
            },
            height: size,
            width: size,
            maxWidthDiskCache: maxWidthDiskCache,
            maxHeightDiskCache: maxHeightDiskCache,
            fit: BoxFit.cover,
          ),
        );

      default:
        return defaultProfileWidget();
    }
  }

  Widget defaultProfileWidget() {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: AppColors.greyBackground,
        borderRadius: BorderRadius.all(
          Radius.circular((size / 2)),
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          AppAssets.personIcon,
          width: size / 3,
          height: size / 3,
        ),
      ),
    );
  }
}
