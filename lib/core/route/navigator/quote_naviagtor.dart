import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/route/navigator/base_navigator.dart';
import 'package:lihkg_flutter/core/route/navigator/navigation_stack_manager.dart';
import 'package:lihkg_flutter/core/route/page_state/default_page_state.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/screen/quote/quote_page.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';

class QuoteNavigator extends BaseNavigator<QuoteRouter> {
  final Post initialPost;
  final BuildContext context;

  const QuoteNavigator({
    super.key,
    required this.initialPost,
    required this.context,
  });

  @override
  getRouter() => QuoteRouter(initialPost: initialPost, context: context);

  static QuoteRouter of(BuildContext context) =>
      BaseNavigator.of<QuoteRouter>(context);
}

class QuoteRouter extends BaseRouter {
  final Post initialPost;
  final BuildContext context;

  QuoteRouter({required this.initialPost, required this.context})
      : super(
            stackManager: NavigationStateManager(
          DefaultPageState(
            name: 'quote_${initialPost.quotePostId}',
            content: QuotePage(targetQuote: initialPost),
          ),
        ));

  void dismiss() {
    Navigator.of(context).pop();
  }

  void showQuote(ThreadContentItemData data) {
    stackManager.push(DefaultPageState(
      name: 'quote_${data.threadId}_${data.postId}',
      content: QuotePage(targetQuote: data),
    ));
  }
}
