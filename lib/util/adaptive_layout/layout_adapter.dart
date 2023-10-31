import 'package:flutter/material.dart';

enum LayoutSize {
  large, compact
}

LayoutSize getLayoutSize(BoxConstraints constraints) {
  return constraints.maxWidth > 600 ? LayoutSize.large : LayoutSize.compact;
}

class AdaptiveLayoutNotifier extends StatefulWidget {
  final Widget child;
  final Function(LayoutSize) onSizeChange;
  const AdaptiveLayoutNotifier({Key? key, required this.child, required this.onSizeChange}) : super(key: key);

  @override
  State createState() => _AdaptiveLayoutNotifierState();
}

class _AdaptiveLayoutNotifierState extends State<AdaptiveLayoutNotifier> {
  LayoutSize? lastSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final newSize = getLayoutSize(constraints);

      if (lastSize != newSize) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
  State createState() => _LayoutAdapterState();
}

class _LayoutAdapterState extends State<LayoutAdapter> {
  LayoutSize? lastSize;
  Widget lastWidget = Container();

  @override
  void didUpdateWidget(covariant LayoutAdapter oldWidget) {
    final lastSize = this.lastSize;
    if (lastSize != null) {
      // Update the cached widget if size is change
      lastWidget = widget.builder(context, lastSize, widget.child);
    }
    super.didUpdateWidget(oldWidget);
  }

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
