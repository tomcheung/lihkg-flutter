import 'package:flutter/material.dart';
import 'package:lihkg_flutter/screen/thread_content/cached_size_image.dart';
import 'package:flutter_html/flutter_html.dart';

CustomRenderMatcher lihkgEmojiUriMatcher() => (context) =>
    (context.tree.attributes['src']?.startsWith('/') ?? false) &&
    context.tree.attributes['class'] == 'hkgmoji';

CustomRender lihkgEmojiImageRender =
    CustomRender.inlineSpan(inlineSpan: (context, buildChildren) {
  final src = context.tree.attributes['src'];
  if (src == null) {
    return const TextSpan();
  }
  const serverRoot = 'https://cdn.lihkg.com';
  final fullPath = serverRoot + src;

  return WidgetSpan(
      child: RepaintBoundary(
    child: SizedBox(
      width: 32,
      height: 24,
      child: Image.network(fullPath, filterQuality: FilterQuality.none),
    ),
  ));
});

CustomRender lihkgImageRender =
    CustomRender.widget(widget: (context, buildChildren) {
  final src = context.tree.attributes['src'];

  if (src == null) {
    return Container();
  }
  // precacheImage(NetworkImage(src), context.buildContext);
  return CachedSizeImage(imageProvider: NetworkImage(src));
});
