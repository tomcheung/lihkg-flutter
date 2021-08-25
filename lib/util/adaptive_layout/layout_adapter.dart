import 'package:flutter/material.dart';

enum LayoutSize {
  Large, Compact
}

LayoutSize getLayoutSize(BoxConstraints constraints) {
  return constraints.maxWidth > 600 ? LayoutSize.Large : LayoutSize.Compact;
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
      final newSize = getLayoutSize(constraints);

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

typedef AdapterLayoutBuilder = Widget Function(
  BuildContext context,
  LayoutSize size,
  Widget? child
);

class LayoutAdapter extends StatefulWidget {
  final AdapterLayoutBuilder builder;
  final Widget? child;
  const LayoutAdapter({Key? key, required this.builder, this.child}) : super(key: key);

  @override
  _LayoutAdapterState createState() => _LayoutAdapterState();
}

class _LayoutAdapterState extends State<LayoutAdapter> {
  LayoutSize? lastSize;
  Widget lastWidget = Container();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final newSize = getLayoutSize(constraints);

      if (lastSize != newSize) {
        lastSize = newSize;
        lastWidget = widget.builder(context, newSize, widget.child);
      }

      return lastWidget;
    });
  }
}
