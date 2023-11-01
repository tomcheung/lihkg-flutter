import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/navigation/quote/quote_navigation_provider.dart';
import 'package:lihkg_flutter/screen/quote/quote_provider.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_item.dart';

import '../../shared_widget/error_message.dart';

class QuotePage extends ConsumerWidget {
  final ThreadContentItemData targetQuote;

  const QuotePage({Key? key, required this.targetQuote}) : super(key: key);

  _closeDialog(BuildContext context, WidgetRef ref) {
    ref.read(quoteNavigationStateProvider.notifier).dismiss();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('回覆'),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => _closeDialog(context, ref),
            )
          ],
          elevation: 0.6,
        ),
        body: QuoteContent(targetQuote: targetQuote),
      ),
    );
  }
}

class QuoteContent extends ConsumerWidget {
  final ThreadContentItemData targetQuote;

  const QuoteContent({Key? key, required this.targetQuote}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final originalPostItem = ThreadContentItem(
      data: targetQuote,
      index: 1,
    );
    final theme = Theme.of(context);

    final quoteList = ref.watch(quoteProvider(threadId: targetQuote.threadId, postId: targetQuote.postId));
    return quoteList.when(
      data: (quoteItem) {
        List<ThreadContentItemData> contents = [targetQuote] + quoteItem;

        return ListView.separated(
          itemBuilder: (ctx, index) {
            final content = contents[index];
            return ThreadContentItem(
              data: content,
              index: index + 1,
            );
          },
          separatorBuilder: (ctx, index) {
            if (index == 0) {
              return Container(
                color: theme.dividerColor,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Text('被引用回覆'),
              );
            } else {
              return Divider(color: theme.dividerColor);
            }
          },
          itemCount: contents.length,
        );
      },
      error: (error, _) => ListView(
        children: [
          originalPostItem,
          const Center(child: Text('無法載入回覆')),
          if (kDebugMode && error is Error)
            Center(child: ErrorMessage(error: error))
        ],
      ),
      loading: () => ListView(
        children: [
          originalPostItem,
          const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
