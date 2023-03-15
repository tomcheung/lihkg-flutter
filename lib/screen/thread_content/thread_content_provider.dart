import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'thread_content_provider.freezed.dart';

part 'thread_content_provider.g.dart';

abstract class ThreadItem {}

@immutable
class ThreadItemContent extends ThreadItem {
  final Post post;

  ThreadItemContent(this.post);
}

@immutable
class ThreadItemPageIndicator extends ThreadItem {
  final int page;

  ThreadItemPageIndicator(this.page);
}

@freezed
class ThreadContentState with _$ThreadContentState {
  factory ThreadContentState({
    required List<ThreadItem> items,
    required ThreadCategoryItem categoryItem,
    required int lastPage,
    required bool ended,
  }) = _ThreadContentState;
}

@riverpod
class ThreadContent extends _$ThreadContent {
  int? _fetchingPage;

  @override
  Future<ThreadContentState> build(ThreadCategoryItem categoryItem) async {
    state = const AsyncValue.loading();

    final webServices = ref.watch(lihkgWebServicesProvider);
    final itemData = await _fetchContent(webServices, 1);

    return ThreadContentState(
      items: itemData,
      categoryItem: categoryItem,
      lastPage: 1,
      ended: itemData.isEmpty,
    );
  }

  void fetchNextPage() async {
    final lastState = state.value;
    if (lastState == null || _fetchingPage != null || lastState.ended) {
      return;
    }

    final webServices = ref.read(lihkgWebServicesProvider);
    final nextPage = lastState.lastPage + 1;
    _fetchingPage = nextPage;

    final itemData = await _fetchContent(webServices, nextPage);

    if (nextPage != _fetchingPage) {
      print(
          'invalid state: fetching page not match: fetch page: $nextPage, expected fetch page in provider state: $_fetchingPage');
      return;
    }

    var newData = List<ThreadItem>.from(lastState.items);
    newData.addAll(itemData);

    state = AsyncValue.data(ThreadContentState(
      items: newData,
      categoryItem: categoryItem,
      lastPage: nextPage,
      ended: itemData.isEmpty,
    ));

    // await Future.delayed(const Duration(milliseconds: 500)); // Throttle fetchNextPage call when list reach to bottom

    _fetchingPage = null;
  }

  void fetchPage(int pageNumber) async {
    final webServices = ref.read(lihkgWebServicesProvider);
    state = const AsyncValue.loading();

    final itemData = await _fetchContent(webServices, pageNumber);
    state = AsyncValue.data(ThreadContentState(
      items: itemData,
      categoryItem: categoryItem,
      lastPage: pageNumber,
      ended: itemData.isEmpty,
    ));
  }

  Future<List<ThreadItem>> _fetchContent(
      LihkgWebServices webServices, int page) async {
    final response = await webServices.getThreadContent(
        threadId: categoryItem.threadId, page: page);
    return response.itemData
        .map((post) => ThreadItemContent(post))
        .cast<ThreadItem>()
        .toList();
  }
}
