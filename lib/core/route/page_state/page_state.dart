export 'default_page_state.dart';
export 'lihkg_root_page_state.dart';
import 'package:flutter/material.dart';
import '../../../util/adaptive_layout/layout_adapter.dart' show LayoutSize;

abstract class PageState {
  String get name;

  List<Page> buildPage(LayoutSize size);

  bool handlePop(Route route);
}