import 'package:flutter/material.dart';
import '../../../util/adaptive_layout/layout_adapter.dart';
import 'page_state.dart';

class DefaultPageState extends PageState {
  @override
  final String name;
  final Widget content;

  DefaultPageState({required this.name, required this.content});

  @override
  List<Page> buildPage(LayoutSize size) {
    return [MaterialPage(child: content)];
  }

  @override
  bool handlePop(Route route) {
    return false;
  }
}
