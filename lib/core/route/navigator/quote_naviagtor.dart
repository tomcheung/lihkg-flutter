import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/route/page_state/default_page_state.dart';
import 'package:lihkg_flutter/model/quote.dart';
import 'package:lihkg_flutter/screen/quote/quote_dialog.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/screen/quote/quote_page.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';
import 'app_navigator.dart';

class QuoteNavigator extends AppNavigator<QuoteNavigatorProvider> {
  Post initialPost;

  QuoteNavigator({Key? key, required this.initialPost}) : super(key: key);

  @override
  QuoteNavigatorProvider createProvider(BuildContext context) =>
      QuoteNavigatorProvider(initialPost, context);
}

class QuoteNavigatorProvider extends AppNavigatorProvider {
  final BuildContext _buildContext;
  final Post initialPost;

  QuoteNavigatorProvider(this.initialPost, this._buildContext)
      : super(
          initialPageState: DefaultPageState(
            name: 'quote_${initialPost.quotePostId}',
            content: QuotePage(targetQuote: initialPost),
          ),
        );

  void dismiss() {
    Navigator.of(_buildContext).pop();
  }

  void showQuote(ThreadContentItemData data) {
    routerDelegate.push(DefaultPageState(
      name: 'quote_${data.threadId}_${data.postId}',
      content: QuotePage(targetQuote: data),
    ));
  }
}
