import 'package:flutter/material.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';

import '../app_router.dart';

class DefaultPageState extends PageState {
  @override
  final String name;
  final Widget Function() builder;
  final Widget _body;

  DefaultPageState({required this.name, required this.builder})
      : _body = builder();

  @override
  List<Page> buildPage(LayoutSize size) {
    return [MaterialPage(child: _body)];
  }

  @override
  bool handlePop(Route route) {
    return false;
  }
}
