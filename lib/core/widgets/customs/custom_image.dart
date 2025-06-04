import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minimart/core/utils/utils.dart' show ImageType;

class CustomImage extends StatelessWidget {
  const CustomImage({
    required this.imageUrl,
    super.key,
    this.isNetwork = false,
    this.config = const ImageConfig(),
  });
  final String imageUrl;
  final bool isNetwork;
  final ImageConfig config;

  static ImageType getImageType(String url) {
    if (url.isEmpty) return ImageType.unknown;

    final extension = url.split('.').last.toLowerCase();
    switch (extension) {
      case 'svg':
        return ImageType.svg;
      case 'png':
        return ImageType.png;
      case 'jpg':
      case 'jpeg':
        return ImageType.jpg;
      case 'gif':
        return ImageType.gif;
      case 'webp':
        return ImageType.webp;
      default:
        return ImageType.unknown;
    }
  }

  Widget _buildNetworkImage() {
    final imageType = getImageType(imageUrl);
    switch (imageType) {
      case ImageType.svg:
        return _buildNetworkSvg();
      case ImageType.png:
      case ImageType.jpg:
      case ImageType.jpeg:
      case ImageType.gif:
      case ImageType.webp:
      case ImageType.unknown:
        return _buildCachedNetworkImage();
    }
  }

  Widget _buildLocalImage() {
    final imageType = getImageType(imageUrl);

    switch (imageType) {
      case ImageType.svg:
        return _buildLocalSvg();
      case ImageType.png:
      case ImageType.jpg:
      case ImageType.jpeg:
      case ImageType.gif:
      case ImageType.webp:
        return _buildAssetImage();
      case ImageType.unknown:
        return _buildFallbackImage();
    }
  }

  Widget _buildNetworkSvg() {
    return SvgPicture.network(
      imageUrl,
      height: config.height,
      width: config.width,
      colorFilter: config.color != null
          ? ColorFilter.mode(
              config.color!,
              BlendMode.srcIn,
            )
          : null,
      fit: config.fit,
      placeholderBuilder: (_) => _buildLoadingIndicator(),
      semanticsLabel: 'Network SVG Image',
    );
  }

  Widget _buildLocalSvg() {
    return SvgPicture.asset(
      imageUrl,
      height: config.height,
      width: config.width,
      colorFilter: config.color != null
          ? ColorFilter.mode(
              config.color!,
              BlendMode.srcIn,
            )
          : null,
      fit: config.fit,
      semanticsLabel: 'Local SVG Image',
    );
  }

  Widget _buildCachedNetworkImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: config.height,
      width: config.width,
      fit: config.fit,
      color: config.color,
      placeholder: (context, url) => _buildLoadingIndicator(),
      errorWidget: (context, url, error) {
        _logError(error);
        return _buildFallbackImage();
      },
      memCacheWidth: config.memCacheWidth,
      memCacheHeight: config.memCacheHeight,
    );
  }

  Widget _buildAssetImage() {
    return Image.asset(
      imageUrl,
      height: config.height,
      width: config.width,
      color: config.color,
      fit: config.fit,
      errorBuilder: (context, error, stackTrace) {
        _logError(error);
        return _buildFallbackImage();
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: config.loadingIndicator ?? const CupertinoActivityIndicator(),
    );
  }

  Widget _buildFallbackImage() {
    // Prefer fallback image if provided, otherwise use default
    if (config.fallbackImageUrl != null) {
      return isNetwork
          ? _buildCachedNetworkImage()
          : Image.asset(
              config.fallbackImageUrl!,
              height: config.height,
              width: config.width,
              fit: config.fit,
            );
    }

    // Fallback to a placeholder or empty container
    return Container(
      height: config.height,
      width: config.width,
      color: Colors.grey[200],
      child: const Icon(Icons.broken_image_outlined),
    );
  }

  void _logError(dynamic error) {
    debugPrint('Image Load Error: $error for URL: $imageUrl');
  }

  @override
  Widget build(BuildContext context) {
    try {
      return isNetwork ? _buildNetworkImage() : _buildLocalImage();
    } catch (e) {
      _logError(e);
      return _buildFallbackImage();
    }
  }
}

class ImageConfig {
  const ImageConfig({
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.color,
    this.fallbackImageUrl,
    this.loadingIndicator,
    this.memCacheWidth,
    this.memCacheHeight,
  });
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;
  final String? fallbackImageUrl;
  final Widget? loadingIndicator;
  final int? memCacheWidth;
  final int? memCacheHeight;
}
