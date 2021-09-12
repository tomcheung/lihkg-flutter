import 'package:flutter/material.dart';
import 'package:lihkg_flutter/dialog/quote/quote_provider.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_item.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';
import 'package:provider/provider.dart';

class QuoteDialog extends StatefulWidget {
  final Post post;

  QuoteDialog({required this.post});

  @override
  _QuoteDialogState createState() => _QuoteDialogState();
}

class _QuoteDialogState extends State<QuoteDialog> {
  late QuoteProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = QuoteProvider(context);
    _provider.loadQuote(widget.post);
  }

  _closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  void didUpdateWidget(covariant QuoteDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.post.postId != widget.post.postId) {
      _provider.loadQuote(widget.post);
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

    return LayoutAdapter(
      builder: (context, size, child) {
        switch (size) {
          case LayoutSize.Large:
            return Dialog(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600, minWidth: 400),
                child: child,
              ),
            );

          case LayoutSize.Compact:
            return Scaffold(
              body: child,
            );
        }
      },
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: _closeDialog,
              ),
            ),
          ),
          Container(height: 1, color: theme.dividerColor.withOpacity(0.3)),
          Expanded(
            child: ListenableProvider.value(
              value: _provider,
              builder: (context, child) {
                final provider = context.watch<QuoteProvider>();
                List<ThreadContentItemData> contents =
                    [widget.post].cast<ThreadContentItemData>() +
                        provider.quotes;

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
                        child: Text('被引用回覆'),
                      );
                    } else {
                      return Divider(color: theme.dividerColor);
                    }
                  },
                  itemCount: contents.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
