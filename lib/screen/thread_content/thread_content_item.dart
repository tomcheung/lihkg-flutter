import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lihkg_flutter/util/content_renderer.dart';
import '../../model/thread_content.dart';

class _ThreadContentItemHeader extends StatelessWidget {
  final ThreadContentResponseItemData data;

  const _ThreadContentItemHeader({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Text('#1', style: TextStyle(color: theme.accentColor)),
          const SizedBox(width: 8),
          Text(data.userNickname, style: TextStyle(color: Colors.blue)),
          const SizedBox(width: 8),
          Text('• 14 小時前', style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

class ThreadContentItem extends StatelessWidget {
  static final Map<ImageSourceMatcher, ImageRender> imageRenderers = {
    lihkgEmojiUriMatcher(): lihkgEmojiImageRender(),
    networkSourceMatcher(): networkImageRender(),
  };

  final ThreadContentResponseItemData data;

  const ThreadContentItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.cardColor,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        children: [
          _ThreadContentItemHeader(data: data),
          Html(
            data: data.msg,
            onImageError: (e, _) {
              print('Fail to load image $e');
            },
            customImageRenders: imageRenderers,
          ),
        ],
      ),
    );
  }
}
