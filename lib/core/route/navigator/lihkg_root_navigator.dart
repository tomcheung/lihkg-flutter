import 'package:flutter/widgets.dart';
import 'package:lihkg_flutter/core/route/navigator/app_navigator.dart';
import 'package:lihkg_flutter/core/route/page_state/fullscreen_imageviewer_page_state.dart';
import 'package:lihkg_flutter/core/route/page_state/page_state.dart';
import 'package:lihkg_flutter/model/thread_category.dart';

class LihkgRootNavigator extends AppNavigator<LihkgRootNavigatorProvider> {
  const LihkgRootNavigator({super.key});

  @override
  LihkgRootNavigatorProvider createProvider(context) => LihkgRootNavigatorProvider();
}

class LihkgRootNavigatorProvider extends AppNavigatorProvider {
  LihkgRootNavigatorProvider()
      : super(initialPageState: LihkgRootPageState(null));

  void showThreadContent(ThreadCategoryItem categoryItem) {
    routerDelegate.pushOrUpdateLast(LihkgRootPageState(categoryItem));
  }
  
  void showFullscreenImage(ImageProvider<Object> imageProvider) {
    routerDelegate.push(FullScreenImageViewerPageState(imageProvider));
  }
}
