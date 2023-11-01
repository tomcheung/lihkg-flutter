import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/screen/fullscreen_image_view/fullscreen_image_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'navigator_page.dart';

part 'lihkg_navigation_provider.freezed.dart';

part 'lihkg_navigation_provider.g.dart';

@freezed
class LihkgNavigationStateData with _$LihkgNavigationStateData {
  factory LihkgNavigationStateData(
      {ThreadCategoryItem? selectedCategoryItem,
      @Default([]) List<MainNavigatorPage> pages}) = _LihkgNavigationStateData;
}

@Riverpod(keepAlive: true)
class LihkgNavigationState extends _$LihkgNavigationState {
  @override
  LihkgNavigationStateData build() {
    return LihkgNavigationStateData();
  }

  void showThreadContent(ThreadCategoryItem categoryItem) {
    state = state.copyWith(selectedCategoryItem: categoryItem);
  }

  void showFullscreenImage(ImageProvider<Object> imageProvider) {
    _pushPage(DefaultNavigatorPage(
      content: FullScreenImageView(imageProvider: imageProvider),
      name: 'image_view',
      fullscreenDialog: true,
    ));
  }

  bool pop() {
    if (state.pages.isEmpty) {
      state = state.copyWith(selectedCategoryItem: null);
      return true;
    }

    var page = List.of(state.pages);
    page.removeLast();
    state = state.copyWith(pages: page);
    return true;
  }

  void _pushPage(MainNavigatorPage pageState) {
    var page = List.of(state.pages);
    page.add(pageState);
    state = state.copyWith(pages: page);
  }
}
