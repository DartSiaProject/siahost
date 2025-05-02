import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
// import 'package:skeletonizer/skeletonizer.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    required this.url,
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.errorWidget,
    this.alignment = Alignment.center,
    this.defaultErrorImage = 'assets/images/default_image.png',
    this.showDefaultImage = true,
    this.httpHeaders,
  });
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Widget? errorWidget;
  final Alignment alignment;
  final String defaultErrorImage;
  final bool showDefaultImage;
  final Map<String, String>? httpHeaders;

  Widget get defaultImageWidget => Image.asset(
        defaultErrorImage,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
      );

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return defaultImageWidget;
    }
    if (url.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        httpHeaders: httpHeaders,
        alignment: alignment,
        color: color,
        placeholder: (context, url) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
        errorWidget: (context, url, error) {
          Logger().e(error);
          return defaultImageWidget;
        },
      );
    }

    if (url.startsWith('assets')) {
      return Image.asset(
        url,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
      );
    }
    return defaultImageWidget;
  }
}
