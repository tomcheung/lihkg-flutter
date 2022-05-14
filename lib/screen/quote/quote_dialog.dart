import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/route/navigator/quote_naviagtor.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';

class QuoteDialog extends StatelessWidget {
  final Post initialPost;

  const QuoteDialog({super.key, required this.initialPost});

  @override
  Widget build(BuildContext context) {
    return LayoutAdapter(
      builder: (context, size, child) {
        switch (size) {
          case LayoutSize.large:
            return Dialog(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600, minWidth: 400),
                child: child,
              ),
              clipBehavior: Clip.hardEdge,
            );

          case LayoutSize.compact:
            return child ?? Container();
        }
      },
      child: QuoteNavigator(initialPost: initialPost),
    );
  }
}