import 'package:flutter/material.dart';

class ImageSizeCacheProvider {
  final Map<String, Size> _cachedSize = {};

  void updateSize(String imageKey, Size size) {
    _cachedSize[imageKey] = size;
  }

  Size? getSize(String imageKey) => _cachedSize[imageKey];
}