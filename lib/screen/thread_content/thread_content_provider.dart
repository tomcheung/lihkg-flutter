
import 'package:flutter/cupertino.dart';
import 'package:lihkg_flutter/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/model/thread_content.dart';

class ThreadContentProvider extends ChangeNotifier {
  ThreadCategoryItem? _category;
  List<ThreadContentResponseItemData> _itemData = [];
  bool _isLoading = false;

  List<ThreadContentResponseItemData> get itemData => _itemData;
  bool get isLoading => _isLoading;
  ThreadCategoryItem? get category => _category;

  Future<void> loadThreadContent(ThreadCategoryItem item) async {
    _category = item;
    _isLoading = true;
    final response = await LihkgWebServices().getThreadContent(threadId: item.threadId);
    notifyListeners();
    _itemData = response.itemData;
    _isLoading = false;
    notifyListeners();
  }
}