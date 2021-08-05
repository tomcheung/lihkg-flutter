import 'package:flutter/cupertino.dart';
import 'package:lihkg_flutter/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/category.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/util/loading_status_mixin.dart';

class ThreadListProvider extends ChangeNotifier with LoadingStatusMixin {
  Category? _currentCategory;
  int _lastPage = 0;

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
      fetchRequest(() async {
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

    fetchRequest(() async {
      final nextPage = _lastPage + 1;
      final response = await LihkgWebServices().getThreadCategory(catId: catId, page: nextPage);
      _lastPage = nextPage;
      _categoryItems.addAll(response.items);
      notifyListeners();
    });

  }

}