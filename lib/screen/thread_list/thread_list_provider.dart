import 'package:flutter/cupertino.dart';
import 'package:lihkg_flutter/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/category.dart';
import 'package:lihkg_flutter/model/thread_category.dart';

class ThreadListProvider extends ChangeNotifier {
  Category? _currentCategory;
  int _lastPage = 0;
  bool _isFetching = false;

  List<ThreadCategoryItem> _categoryItems = [];
  List<ThreadCategoryItem> get categoryItems => _categoryItems;

  _reset() {
    _currentCategory = null;
    _lastPage = 0;
    _categoryItems = [];
  }

  Future<void> getThreadList(Category? category) async {
    if (category == null) {
      _reset();
      notifyListeners();
    } else if (category.catId != _currentCategory?.catId) {
      _fetchRequest(() async {
        final response = await LihkgWebServices().getThreadCategory(catId: category.catId, page: 1);
        _lastPage = 1;
        _categoryItems = response.items;
        _currentCategory = category;
        notifyListeners();
      });
    }
  }

  loadMore() async {
    final catId = _currentCategory?.catId;
    if (catId == null) {
      return;
    }

    _fetchRequest(() async {
      final nextPage = _lastPage + 1;
      print('load more $nextPage');

      final response = await LihkgWebServices().getThreadCategory(catId: catId, page: nextPage);
      _lastPage = nextPage;
      _categoryItems.addAll(response.items);
      notifyListeners();
    });

  }

  _fetchRequest(Future<void> Function() fn) async {
    if (_isFetching) {
      return;
    }

    try {
      _isFetching = true;
      await fn();
    } catch (e) {
      print('fetch thread list fail $e');
    } finally {
      _isFetching = false;
    }
  }

}