import 'package:lihkg_flutter/core/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/quote.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quote_provider.g.dart';

@riverpod
Future<List<Quote>> quote(
  QuoteRef ref, {
  required String threadId,
  required String postId,
}) async {
  final api = ref.watch(lihkgWebServicesProvider);

  final quotes = await api.getQuote(threadId: threadId, postId: postId);
  return quotes.itemData;
}
