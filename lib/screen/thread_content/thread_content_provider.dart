import 'package:flutter/widgets.dart';
import 'package:lihkg_flutter/core/api_provider.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/util/loading_status_mixin.dart';

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

class ThreadContentProvider extends ApiProvider with LoadingStatusMixin {
  ThreadCategoryItem? _categoryItem;
  int _lastPage = 1;
  bool ended = false;

  List<ThreadItem> _itemData = [];
  List<ThreadItem> get itemData => _itemData;
  ThreadCategoryItem? get category => _categoryItem;

  ThreadContentProvider(BuildContext context) : super(context);

  Future<void> loadNextPage() async {
    final threadId = _categoryItem?.threadId;
    if (threadId != null && !isLoading && !ended) {
      await fetchRequest(() async {
        final nextPage = _lastPage + 1;
        final response = await webServices
            .getThreadContent(threadId: threadId, page: nextPage);
        if (response.itemData.isNotEmpty) {
          _itemData.add(ThreadItemPageIndicator(nextPage));
        }
        final data = response.itemData.map((post) => ThreadItemContent(post));
        _itemData.addAll(data);
        ended = response.itemData.isEmpty;
        _lastPage += 1;
      });
    }
  }

  Future<void> loadThreadContent(ThreadCategoryItem item, {int initialPage = 1}) async {
    _categoryItem = item;
    _lastPage = initialPage;
    _itemData = [];
    ended = false;
    await fetchRequest(() async {
      final response = await webServices
          .getThreadContent(threadId: item.threadId, page: initialPage);
      _itemData = response.itemData.map((post) => ThreadItemContent(post)).cast<ThreadItem>().toList();

      if (initialPage > 1) {
        itemData.insert(0, ThreadItemPageIndicator(initialPage));
      }
    });
  }
}
