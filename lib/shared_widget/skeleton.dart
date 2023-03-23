import 'package:flutter/material.dart';

class SkeletonBlock extends StatelessWidget {
  final double? width;
  final double? height;

  const SkeletonBlock({Key? key, this.width, this.height = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final skeletonColor = theme.textTheme.bodyMedium?.color?.withOpacity(0.1);

    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: skeletonColor,
      ),
    );
  }
}