import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lihkg_flutter/core/navigation/main/lihkg_navigation_provider.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quote_navigation_provider.freezed.dart';

part 'quote_navigation_provider.g.dart';

@freezed
class QuoteNavigationStateData with _$QuoteNavigationStateData {
  factory QuoteNavigationStateData({
    @Default([]) List<ThreadContentItemData> quoteStack,
  }) = _QuoteNavigationStateData;
}

@riverpod
class QuoteNavigationState extends _$QuoteNavigationState {
  @override
  QuoteNavigationStateData build() {
    return QuoteNavigationStateData();
  }

  void showQuote(ThreadContentItemData item) {
    final rootNavigationProvider = ref.read(lihkgNavigationStateProvider.notifier);
    rootNavigationProvider.createQuoteRootDialog();

    var quotes = List.of(state.quoteStack);
    quotes.add(item);
    state = state.copyWith(quoteStack: quotes);
  }

  bool pop() {
    if (state.quoteStack.isEmpty) {
      return false;
    }

    var quotes = List.of(state.quoteStack);
    quotes.removeLast();
    state = state.copyWith(quoteStack: quotes);
    return true;
  }

  void dismiss() {
    state = QuoteNavigationStateData();
  }
}
