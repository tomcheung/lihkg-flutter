import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/route/page_state/page_state.dart';
import 'package:lihkg_flutter/screen/fullscreen_image_view/fullscreen_image_view.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';

class FullScreenImageViewerPageState extends PageState {
  final ImageProvider<Object> imageProvider;

  FullScreenImageViewerPageState(this.imageProvider);

  @override
  List<Page> buildPage(LayoutSize size) {
    return [
      MaterialPage(child: FullScreenImageView(imageProvider: imageProvider), fullscreenDialog: true)
    ];
  }

  @override
  bool handlePop(Route route) {
    return false;
  }

  @override
  String get name => 'ImageViewer';
}