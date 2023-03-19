import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_size_cache_provider.g.dart';

@riverpod
class ImageSizeCache extends _$ImageSizeCache {
  @override
  Map<String, Size> build() {
    return Map.identity();
  }

  void updateSize(String imageKey, Size size) {
    var newState = state;
    newState[imageKey] = size;
    state = newState;
  }

  Size? getSize(String imageKey) => state[imageKey];
}