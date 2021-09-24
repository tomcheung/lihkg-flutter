import 'package:flutter/material.dart';
import 'package:lihkg_flutter/screen/thread_content/cached_size_image.dart';
import 'package:flutter_html/flutter_html.dart';

ImageSourceMatcher lihkgEmojiUriMatcher() => (attributes, element) =>
    (attributes['src']?.startsWith('/') ?? false) &&
    attributes['class'] == 'hkgmoji';

ImageRender lihkgEmojiImageRender() => (context, attributes, element) {
      final src = attributes['src'];
      if (src == null) {
        return null;
      }
      final serverRoot = 'https://cdn.lihkg.com';
      final fullPath = serverRoot + src;
      return RepaintBoundary(
        child: SizedBox(
          width: 32,
          height: 24,
          child: Image.network(fullPath, filterQuality: FilterQuality.none),
        ),
      );
    };

ImageRender lihkgImageRender() => (context, attributes, element) {
      final src = attributes['src'];

      if (src == null) {
        return Container();
      }
      // precacheImage(NetworkImage(src), context.buildContext);
      return CachedSizeImage(imageProvider: NetworkImage(src));
    };
