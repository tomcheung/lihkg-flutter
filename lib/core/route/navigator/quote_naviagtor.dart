import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/route/page_state/default_page_state.dart';
import 'package:lihkg_flutter/dialog/quote/quote_dialog.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'app_navigator.dart';

class QuoteNavigator extends AppNavigator<QuoteNavigatorProvider> {
  Post initialPost;

  QuoteNavigator({Key? key, required this.initialPost}) : super(key: key);

  @override
  QuoteNavigatorProvider createProvider() =>
      QuoteNavigatorProvider(initialPost);
}

class QuoteNavigatorProvider extends AppNavigatorProvider {
  QuoteNavigatorProvider(Post initialPost)
      : super(
          initialPageState: DefaultPageState(
            name: 'quote_${initialPost.quotePostId}',
            content: QuoteDialog(post: initialPost),
          ),
        );
}
