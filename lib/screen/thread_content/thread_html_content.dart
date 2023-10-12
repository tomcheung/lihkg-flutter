import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lihkg_flutter/util/html_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class ThreadHtmlContent extends StatelessWidget {
  final String html;
  final Style? defaultTextStyle;
  const ThreadHtmlContent(this.html, {this.defaultTextStyle, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final wildcardTextStyle = defaultTextStyle;
    return Html(
      data: html,
      style: (wildcardTextStyle != null) ? {
        "*": wildcardTextStyle
      } : {},
      extensions: [lihkgEmojiUriExtension, lihkgCachedSizeImageExtension],
      onLinkTap: (url, context, element) async {
        if (url == null) {
          return;
        }
        final uri = Uri.parse(url);
        if (!await launchUrl(uri)) throw 'Could not launch $uri';
      },
    );
  }
}

