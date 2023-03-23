import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lihkg_flutter/core/route/navigator/navigation_stack_manager.dart';
import 'package:lihkg_flutter/core/route/page_state/lihkg_root_page_state.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';

import '../page_state/fullscreen_imageviewer_page_state.dart';
import 'base_navigator.dart';

class LihkgRootNavigator extends BaseNavigator<LihkgRootRouter> {
  const LihkgRootNavigator({super.key});

  @override
  LihkgRootRouter getRouter() => LihkgRootRouter();

  static LihkgRootRouter of(BuildContext context) =>
      BaseNavigator.of<LihkgRootRouter>(context);
}

class LihkgRootRouter extends BaseRouter {
  LihkgRootRouter()
      : super(stackManager: NavigationStateManager(LihkgRootPageState(null)));

  void showThreadContent(ThreadCategoryItem categoryItem) {
    stackManager.pushOrUpdateLast(LihkgRootPageState(categoryItem));
  }

  void showFullscreenImage(ImageProvider<Object> imageProvider) {
    stackManager.push(FullScreenImageViewerPageState(imageProvider));
  }

  LayoutSize get layoutSize => stackManager.layoutSize;
}
