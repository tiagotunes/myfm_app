import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myfm/common/widgets/loaders/shimmer.dart';
import 'package:myfm/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.fitWidth,
    this.padding,
    this.borderRadius = TSizes.borderRadiusMd,
    this.onPressed,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius, isNetworkImage;
  final Border? border;
  final double borderRadius;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const TShimmerEffect(
                    width: double.infinity,
                    height: double.infinity,
                    radius: TSizes.borderRadiusMd,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(imageUrl),
                  color: backgroundColor,
                ),
        ),
      ),
    );
  }
}
