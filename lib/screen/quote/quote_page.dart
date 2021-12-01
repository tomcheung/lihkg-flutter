import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/route/navigator/quote_naviagtor.dart';
import 'package:lihkg_flutter/screen/quote/quote_provider.dart';
import 'package:lihkg_flutter/screen/thread_content/image_size_cache_provider.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_item.dart';
import 'package:provider/provider.dart';

class QuotePage extends StatefulWidget {
  final ThreadContentItemData targetQuote;

  const QuotePage({Key? key, required this.targetQuote}) : super(key: key);

  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  late QuoteProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = QuoteProvider(context);
    _provider.loadQuote(widget.targetQuote.threadId, widget.targetQuote.postId);
  }

  _closeDialog() {
    context.read<QuoteNavigatorProvider>().dismiss();
  }

  @override
  void didUpdateWidget(covariant QuotePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetQuote.threadId != widget.targetQuote.threadId) {
      _provider.loadQuote(widget.targetQuote.threadId, widget.targetQuote.postId);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _provider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Provider(
      create: (context) => ImageSizeCacheProvider(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: _closeDialog,
              )
            ],
            elevation: 0.6,
          ),
          body: ListenableProvider.value(
            value: _provider,
            builder: (context, child) {
              final provider = context.watch<QuoteProvider>();
              List<ThreadContentItemData> contents =
                  [widget.targetQuote] + provider.quotes;

              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final content = contents[index];
                  return ThreadContentItem(
                    data: content,
                    index: index,
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
          ),
        );
      }),
    );
  }
}
