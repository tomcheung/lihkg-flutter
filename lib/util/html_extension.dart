import 'package:flutter/material.dart';
import 'package:lihkg_flutter/screen/thread_content/cached_size_image.dart';
import 'package:flutter_html/flutter_html.dart';

MatcherExtension lihkgEmojiUriExtension = MatcherExtension(
  matcher: (context) {
    final attributes = context.attributes;
    return (attributes['src']?.startsWith('/') ?? false) && attributes['class'] == 'hkgmoji';
  },
  builder: (context) {
    final src = context.attributes['src'];
    if (src == null) {
      return Container();
    }
    const serverRoot = 'https://cdn.lihkg.com';
    final fullPath = serverRoot + src;

    return RepaintBoundary(
      child: SizedBox(
        width: 32,
        height: 24,
        child: Image.network(fullPath, filterQuality: FilterQuality.none),
      ),
    );
  }
);

ImageExtension lihkgCachedSizeImageExtension = ImageExtension(
  builder: (context) {
    final src = context.attributes['src'];

    if (src == null) {
      return Container();
    }
    // precacheImage(NetworkImage(src), context.buildContext);
    return CachedSizeImage(imageProvider: NetworkImage(src));
  }
);