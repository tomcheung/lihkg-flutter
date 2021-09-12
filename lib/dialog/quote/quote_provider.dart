import 'package:flutter/widgets.dart';
import 'package:lihkg_flutter/core/api_provider.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/model/quote.dart';
import 'package:lihkg_flutter/util/loading_status_mixin.dart';

class QuoteProvider extends ApiProvider with LoadingStatusMixin {
  Post? _post;
  List<Quote> quotes = [];

  QuoteProvider(BuildContext context) : super(context);

  Future<void> loadQuote(Post post) async {
    _post = post;
    await fetchRequest(() async {
      final response = await webServices.getQuote(
          threadId: post.threadId, postId: post.postId);

      quotes = response.itemData;
    });
  }
}
