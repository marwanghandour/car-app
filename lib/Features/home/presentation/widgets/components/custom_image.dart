import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_icons.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl, this.height});

  final double? height;

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      height: height,
      width: double.infinity,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) => const Icon(color: Colors.red,
        AppIcons.error,
      ),
    );
  }
}
