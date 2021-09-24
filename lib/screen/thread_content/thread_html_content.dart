import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lihkg_flutter/util/content_renderer.dart';

class ThreadHtmlContent extends StatelessWidget {
  static final Map<ImageSourceMatcher, ImageRender> imageRenderers = {
    lihkgEmojiUriMatcher(): lihkgEmojiImageRender(),
    networkSourceMatcher(): lihkgImageRender(),
  };

  final String html;
  final Style? defaultTextStyle;
  ThreadHtmlContent(this.html, {this.defaultTextStyle});

  @override
  Widget build(BuildContext context) {
    final wildcardTextStyle = defaultTextStyle;
    return Html(
      data: html,
      onImageError: (e, _) {
        print('Fail to load image $e');
      },
      style: (wildcardTextStyle != null) ? {
        "*": wildcardTextStyle
      } : {},
      customImageRenders: imageRenderers,
    );
  }
}

