import 'package:flutter/material.dart';

class ImageSizeCacheProvider {
  Map<String, Size> _cachedSize = Map();

  void updateSize(String imageKey, Size size) {
    _cachedSize[imageKey] = size;
  }

  Size? getSize(String imageKey) => _cachedSize[imageKey];
}