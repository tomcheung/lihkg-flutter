import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';

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
              child:
                  Image.network(fullPath, filterQuality: FilterQuality.none)));
    };
