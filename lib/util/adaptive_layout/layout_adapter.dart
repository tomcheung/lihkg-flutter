import 'package:flutter/material.dart';

enum LayoutSize {
  Large, Compact
}

class AdaptiveLayoutNotifier extends StatefulWidget {
  final Widget child;
  final Function(LayoutSize) onSizeChange;
  const AdaptiveLayoutNotifier({Key? key, required this.child, required this.onSizeChange}) : super(key: key);

  @override
  _AdaptiveLayoutNotifierState createState() => _AdaptiveLayoutNotifierState();
}

class _AdaptiveLayoutNotifierState extends State<AdaptiveLayoutNotifier> {
  LayoutSize? lastSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final newSize = constraints.maxWidth > 600 ? LayoutSize.Large : LayoutSize.Compact;

      if (lastSize != newSize) {
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          widget.onSizeChange(newSize);
        });

        lastSize = newSize;
      }

      return widget.child;
    });
  }
}
