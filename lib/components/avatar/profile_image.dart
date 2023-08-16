import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:todyapp/utils/index.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.imageUrl,
    this.size = 48,
    this.fit = BoxFit.cover,
    this.maxWidthDiskCache = 1024,
    this.maxHeightDiskCache = 1024,
  });

  final double size;
  final String imageUrl;
  final BoxFit fit;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((size / 2)),
      ),
      child: _getProfileImage(),
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
        child: Image.asset(
          AppAssets.personIcon,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
