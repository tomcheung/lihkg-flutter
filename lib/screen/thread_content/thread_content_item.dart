import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/screen/quote/quote_dialog.dart';
import 'package:lihkg_flutter/core/route/navigator/quote_naviagtor.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_html_content.dart';
import 'package:lihkg_flutter/shared_widget/icon_with_text.dart';
import 'package:lihkg_flutter/util/extensions/date_util.dart';
import 'thread_content_provider.dart';

class _ThreadContentItemHeader extends StatelessWidget {
  final ThreadContentItemData data;
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
          Text('#$index', style: TextStyle(color: theme.colorScheme.secondary)),
          const SizedBox(width: 8),
          Text(data.userNickname, style: const TextStyle(color: Colors.blue)),
          const SizedBox(width: 8),
          Text('• $dateString', style: theme.textTheme.titleSmall),
        ],
      ),
    );
  }
}

class _ThreadContentItemFooter extends StatelessWidget {
  final ThreadContentItemData data;

  const _ThreadContentItemFooter(this.data);

  Future<void> _openQuote(
      BuildContext context, ThreadContentItemData data) async {
    if (context.findAncestorWidgetOfExactType<QuoteDialog>() != null) {
      final quoteNavigator = QuoteNavigator.of(context);
      if (quoteNavigator.initialPost == data) {
        return;
      }
      quoteNavigator.showQuote(data);
    } else if (data is Post) {
      await showDialog(
        context: context,
        builder: (BuildContext context) => QuoteDialog(initialPost: data),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.colorScheme.onSurface.withOpacity(0.05);
    final decoration = BoxDecoration(
      color: backgroundColor,
      border: Border.all(color: backgroundColor.withOpacity(0.1)),
      borderRadius: BorderRadius.circular(4),
    );

    return Row(
      children: [
        Container(
          height: 34,
          decoration: decoration,
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
        if (data.noOfQuote > 0)
          Container(
            decoration: decoration,
            height: 34,
            margin: const EdgeInsets.only(left: 8),
            child: TextButton(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(50, 34)),
              onPressed: () {
                _openQuote(context, data);
              },
              child: IconWithText(
                text: data.noOfQuote.toString(),
                iconData: Icons.chat_bubble_rounded,
              ),
            ),
          )
      ],
    );
  }
}

class ThreadQuoteContent extends StatelessWidget {
  final PostQuote quote;

  const ThreadQuoteContent({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor =
        theme.textTheme.bodyMedium?.color?.withOpacity(0.5) ?? Colors.black45;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: theme.dividerColor, width: 3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
          child: ThreadHtmlContent(
            quote.msg,
            defaultTextStyle: Style(color: textColor),
          ),
        ),
      ),
    );
  }
}

class ThreadContentItem extends StatelessWidget {
  final ThreadContentItemData data;
  final int index;

  const ThreadContentItem({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTextStyle = theme.textTheme.bodyMedium;
    final quote = data.quote;
    return Container(
      color: theme.cardColor,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ThreadContentItemHeader(data, index: index),
          if (quote != null) ThreadQuoteContent(quote: quote),
          ThreadHtmlContent(data.msg, defaultTextStyle: Style(color: defaultTextStyle?.color)),
          const SizedBox(height: 8),
          _ThreadContentItemFooter(data)
        ],
      ),
    );
  }
}

class ThreadContentPageIndicator extends StatelessWidget {
  final int page;

  const ThreadContentPageIndicator({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24,  bottom: 12),
      child: Center(
        child: Text('第$page頁'),
      ),
    );
  }
}

class ThreadContentPageDrawer extends ConsumerWidget {
  final ThreadCategoryItem categoryItem;
  const ThreadContentPageDrawer({Key? key, required this.categoryItem}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Drawer(
      width: 120,
      child: ListView(
        children: List.generate(
          categoryItem.totalPage,
              (index) => ListTile(
            textColor: theme.textTheme.bodyMedium?.color,
            title: Text('第${index + 1}頁', textAlign: TextAlign.center),
            onTap: () {
              final threadContentNotifier = ref.read(threadContentProvider(categoryItem).notifier);
              threadContentNotifier.fetchPage(index + 1);
              Scaffold.of(context).closeEndDrawer();
            },
          ),
        ),
      ),
    );
  }
}
