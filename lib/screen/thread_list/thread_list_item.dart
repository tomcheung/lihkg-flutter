import 'package:flutter/material.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/shared_widget/icon_with_text.dart';
import 'package:lihkg_flutter/util/extension.dart';

class ThreadListItem extends StatelessWidget {
  final ThreadCategoryItem item;
  final VoidCallback? onTap;

  const ThreadListItem({Key? key, required this.item, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subtitleStyle = theme.textTheme.titleSmall;
    final fontStyle = theme.textTheme.titleMedium;
    final netLikeCount = item.likeCount - item.dislikeCount;
    final likeIcon = netLikeCount > 0 ? Icons.thumb_up_alt : Icons.thumb_down;

    return Card.filled(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
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
                    text: item.noOfReply.toString(),
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
        ),
      ),
    );
  }
}
