import 'package:flutter/material.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/screen/root/main_page.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_page.dart';
import 'package:lihkg_flutter/screen/thread_list/thread_list_page.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';
import 'package:lihkg_flutter/util/adaptive_layout/split_layout.dart';

import 'page_state.dart';

class LihkgRootPageState extends PageState {
  ThreadCategoryItem? selectedCategoryItem;

  @override
  final String name;

  LihkgRootPageState(this.selectedCategoryItem)
      : name =
  "LihkgRoot ${selectedCategoryItem?.title ?? 'null'}";

  @override
  bool handlePop(Route route) {
    if (selectedCategoryItem != null) {
      selectedCategoryItem = null;
      return true;
    } else {
      return false;
    }
  }

  @override
  List<Page> buildPage(LayoutSize size) {
    switch (size) {
      case LayoutSize.Large:
        return [
          MaterialPage(
            child: MainPage(
              child: SplitLayout(
                left: const ThreadListPage(),
                right: ThreadContentPage(categoryItem: selectedCategoryItem),
              ),
            ),
          )
        ];

      case LayoutSize.Compact:
        return [
          const MaterialPage(
            child: MainPage(
              child: ThreadListPage(),
            ),
          ),
          if (selectedCategoryItem != null)
            MaterialPage(
              child: Scaffold(
                body: ThreadContentPage(categoryItem: selectedCategoryItem),
              ),
            ),
        ];
    }
  }
}