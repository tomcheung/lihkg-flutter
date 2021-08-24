import 'package:flutter/cupertino.dart';
import 'package:lihkg_flutter/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/util/loading_status_mixin.dart';

class ThreadContentProvider extends ChangeNotifier with LoadingStatusMixin {
  ThreadCategoryItem? _categoryItem;
  int _lastPage = 1;
  bool ended = false;
  List<Post> _itemData = [];

  List<Post> get itemData => _itemData;

  ThreadCategoryItem? get category => _categoryItem;

  Future<void> loadNextPage() async {
    final threadId = _categoryItem?.threadId;
    if (threadId != null && !isLoading && !ended) {
      await fetchRequest(() async {
        final response = await LihkgWebServices()
            .getThreadContent(threadId: threadId, page: _lastPage + 1);
        _itemData.addAll(response.itemData);
        ended = response.itemData.isEmpty;
        _lastPage += 1;
      });
    }
  }

  Future<void> loadThreadContent(ThreadCategoryItem item) async {
    _categoryItem = item;
    _lastPage = 1;
    _itemData = [];
    ended = false;
    await fetchRequest(() async {
      final response = await LihkgWebServices()
          .getThreadContent(threadId: item.threadId, page: 1);
      _itemData = response.itemData;
    });
  }
}
