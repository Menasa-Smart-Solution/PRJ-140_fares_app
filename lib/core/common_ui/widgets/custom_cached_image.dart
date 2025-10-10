import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.placeholder,
    this.radius,
    this.errorWidget,
  });
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: imageUrl == null || imageUrl!.isEmpty
          ? Container(
              width: width,
              height: height,
              color: Colors.black.withAlpha(80),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl!,
              width: width,
              color: color,
              height: height,
              colorBlendMode: color != null ? BlendMode.darken : null,
              fit: fit ?? BoxFit.cover,

              placeholder: (context, url) =>
                  placeholder ??
                  Skeletonizer(
                    enabled: true,
                    child: Container(
                      width: width ?? double.infinity,
                      height: height,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(radius ?? 0),
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) => Center(
                child:
                    errorWidget ??
                    const Icon(Icons.error_outline, color: Colors.red),
              ),
            ),
    );
  }
}
