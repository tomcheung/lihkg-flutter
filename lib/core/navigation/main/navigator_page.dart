import 'package:flutter/material.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/screen/root/main_page.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_page.dart';
import 'package:lihkg_flutter/screen/thread_list/thread_list_page.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';
import 'package:lihkg_flutter/util/adaptive_layout/split_layout.dart';

sealed class MainNavigatorPage {
  String get name;
  bool handlePop(Route route);
}

class DefaultNavigatorPage extends MainNavigatorPage {
  @override
  final String name;
  final Widget content;
  final bool fullscreenDialog;

  DefaultNavigatorPage(
      {required this.name, required this.content, this.fullscreenDialog = false});

  Page buildPage(LayoutSize size) {
    return MaterialPage(child: content, fullscreenDialog: fullscreenDialog);
  }

  @override
  bool handlePop(Route route) {
    return false;
  }
}


class RootSplitViewNavigatorPage extends MainNavigatorPage {
  ThreadCategoryItem? selectedCategoryItem;

  @override
  final String name;

  RootSplitViewNavigatorPage(this.selectedCategoryItem)
      : name = "LihkgRoot ${selectedCategoryItem?.title ?? 'null'}";

  @override
  bool handlePop(Route route) {
    if (selectedCategoryItem != null) {
      selectedCategoryItem = null;
      return true;
    } else {
      return false;
    }
  }

  List<Page> buildPage(LayoutSize size) {
    final threadListKey = ObjectKey(selectedCategoryItem);
    switch (size) {
      case LayoutSize.large:
        return [
          MaterialPage(
            child: MainPage(
              child: SplitLayout(
                left: const ThreadListPage(),
                right: ThreadContentPage(key: threadListKey, categoryItem: selectedCategoryItem),
              ),
            ),
          )
        ];

      case LayoutSize.compact:
        return [
          const MaterialPage(
            child: MainPage(
              child: ThreadListPage(),
            ),
          ),
          if (selectedCategoryItem != null)
            MaterialPage(
              child: Scaffold(
                body: ThreadContentPage(key: threadListKey, categoryItem: selectedCategoryItem),
              ),
            ),
        ];
    }
  }
}
