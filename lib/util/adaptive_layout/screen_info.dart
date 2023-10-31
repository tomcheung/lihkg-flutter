import 'package:flutter/cupertino.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';

class ScreenInfo extends InheritedWidget {
  final LayoutSize layoutSize;

  const ScreenInfo({super.key, required this.layoutSize, required super.child});

  @override
  bool updateShouldNotify(covariant ScreenInfo oldWidget) {
    return oldWidget.layoutSize != layoutSize;
  }

  static ScreenInfo of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ScreenInfo>()!;
  }
}