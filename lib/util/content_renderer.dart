import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lihkg_flutter/lihkg_webservices.dart';

ImageSourceMatcher lihkgEmojiUriMatcher() => (attributes, element) =>
    (attributes['src']?.startsWith('/') ?? false) &&
    attributes['class'] == 'hkgmoji';

ImageRender lihkgEmojiImageRender() => (context, attributes, element) {
      final src = attributes['src'];
      if (src == null) {
        return null;
      }
      final fullPath = LihkgWebServices.serverRoot + src;
      return Image.network(fullPath, width: 24, filterQuality: FilterQuality.none);
    };
