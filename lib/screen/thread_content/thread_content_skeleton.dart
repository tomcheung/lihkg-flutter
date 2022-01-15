import 'package:flutter/material.dart';
import 'package:lihkg_flutter/shared_widget/skeleton.dart';

class ThreadContentSkeleton extends StatelessWidget {
  const ThreadContentSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(bottom: 12),
      color: theme.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              SkeletonBlock(width: 20, height: 16),
              SkeletonBlock(width: 60, height: 16),
              SkeletonBlock(width: 40, height: 12)
            ],
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SkeletonBlock(height: 16),
                SizedBox(height: 8),
                SkeletonBlock(height: 16),
                SizedBox(height: 8),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: SkeletonBlock(height: 16),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          const SkeletonBlock(width: 80, height: 34)
        ],
      ),
    );
  }
}
