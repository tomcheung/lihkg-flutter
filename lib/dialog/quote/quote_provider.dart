import 'package:flutter/cupertino.dart';
import 'package:lihkg_flutter/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/model/quote.dart';
import 'package:lihkg_flutter/util/loading_status_mixin.dart';

class QuoteProvider extends ChangeNotifier with LoadingStatusMixin {
  Post? _post;
  List<Quote> quotes = [];

  QuoteProvider();

  Future<void> loadQuote(Post post) async {
    _post = post;
    await fetchRequest(() async {
      final response = await LihkgWebServices()
          .getQuote(threadId: post.threadId, postId: post.postId);

      quotes = response.itemData;
    });
  }
}
