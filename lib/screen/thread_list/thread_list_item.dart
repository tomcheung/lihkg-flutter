import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/shared_widget/icon_with_text.dart';
import 'package:lihkg_flutter/util/extension.dart';

class ThreadListItem extends StatelessWidget {
  final ThreadCategoryItem item;

  const ThreadListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subtitleStyle = theme.textTheme.subtitle2;
    final fontStyle = theme.textTheme.subtitle1;
    final netLikeCount = item.likeCount - item.dislikeCount;
    final likeIcon = netLikeCount > 0 ? Icons.thumb_up_alt : Icons.thumb_down;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.userNickname,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              IconWithText(
                text: netLikeCount.toString(),
                iconData: likeIcon,
                textFirst: true,
              ),
              const SizedBox(width: 4),
              IconWithText(
                text: item.noOfReply,
                iconData: Icons.chat_bubble,
                textFirst: true,
              ),
              const SizedBox(width: 12),
              Text(
                item.lastReplyTime.dateAgoString(),
                style: subtitleStyle,
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
