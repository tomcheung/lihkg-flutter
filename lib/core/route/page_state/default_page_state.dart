import 'package:flutter/material.dart';
import '../../../util/adaptive_layout/layout_adapter.dart';
import 'page_state.dart';

class DefaultPageState extends PageState {
  @override
  final String name;
  final Widget content;
  final bool fullscreenDialog;

  DefaultPageState({required this.name, required this.content, this.fullscreenDialog = false});

  @override
  List<Page> buildPage(LayoutSize size) {
    return [MaterialPage(child: content, fullscreenDialog: fullscreenDialog)];
  }

  @override
  bool handlePop(Route route) {
    return false;
  }
}
