import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lihkg_flutter/shared_widget/icon_with_text.dart';
import 'package:lihkg_flutter/util/content_renderer.dart';
import '../../model/thread_content.dart';
import '../../util/extensions/date_util.dart';

class _ThreadContentItemHeader extends StatelessWidget {
  final ThreadContentResponseItemData data;
  final int index;

  const _ThreadContentItemHeader(
    this.data, {
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String dateString = data.replyTime.dateAgoString();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Text('#$index', style: TextStyle(color: theme.accentColor)),
          const SizedBox(width: 8),
          Text(data.userNickname, style: TextStyle(color: Colors.blue)),
          const SizedBox(width: 8),
          Text('• $dateString', style: theme.textTheme.subtitle2),
        ],
      ),
    );
  }
}

class _ThreadContentItemFooter extends StatelessWidget {
  final ThreadContentResponseItemData data;

  _ThreadContentItemFooter(this.data);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconWithText(
                text: data.likeCount.toString(),
                iconData: Icons.thumb_up,
              ),
              const SizedBox(width: 8),
              IconWithText(
                text: data.dislikeCount.toString(),
                iconData: Icons.thumb_down,
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ],
    );
  }
}

class ThreadContentItem extends StatelessWidget {
  static final Map<ImageSourceMatcher, ImageRender> imageRenderers = {
    lihkgEmojiUriMatcher(): lihkgEmojiImageRender(),
    networkSourceMatcher(): networkImageRender(),
  };

  final ThreadContentResponseItemData data;
  final int index;

  const ThreadContentItem({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.cardColor,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _ThreadContentItemHeader(data, index: index),
          Html(
            data: data.msg,
            onImageError: (e, _) {
              print('Fail to load image $e');
            },
            customImageRenders: imageRenderers,
          ),
          const SizedBox(height: 8),
          _ThreadContentItemFooter(data)
        ],
      ),
    );
  }
}
