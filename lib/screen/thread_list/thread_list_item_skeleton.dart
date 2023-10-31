import 'package:flutter/material.dart';
import 'package:lihkg_flutter/shared_widget/skeleton.dart';

class ThreadListItemSkeleton extends StatelessWidget {
  const ThreadListItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SkeletonBlock(width: 80, height: 16),
              Spacer(),
              SkeletonBlock(width: 110, height: 16),
            ],
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonBlock(height: 22),
              SizedBox(height: 8),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: SkeletonBlock(height: 22),
              )
            ],
          ),
        ],
      ),
    );
  }
}
