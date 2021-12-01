import 'package:flutter/widgets.dart';
import 'package:lihkg_flutter/core/api_provider.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/model/quote.dart';
import 'package:lihkg_flutter/util/loading_status_mixin.dart';

class QuoteProvider extends ApiProvider with LoadingStatusMixin {
  List<Quote> quotes = [];

  QuoteProvider(BuildContext context) : super(context);

  Future<void> loadQuote(String threadId, String postId) async {
    await fetchRequest(() async {
      final response = await webServices.getQuote(
        threadId: threadId,
        postId: postId,
      );

      quotes = response.itemData;
    });
  }
}
