import 'package:flutter/material.dart';
import 'package:lihkg_flutter/model/thread_category.dart';

class ThreadListItem extends StatelessWidget {
  final ThreadCategoryItem item;

  const ThreadListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.subtitle1;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item.userNickname,
                style: const TextStyle(color: Colors.blueAccent, fontSize: 13),
              ),
              const SizedBox(width: 8),
              Text(
                '2 小時前',
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            style: fontStyle,
          )
        ],
      ),
    );
  }
}
