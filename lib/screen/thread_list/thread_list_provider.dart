import 'package:flutter/widgets.dart';
import 'package:lihkg_flutter/core/api_provider.dart';
import 'package:lihkg_flutter/model/category.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/util/loading_status_mixin.dart';

class ThreadListProvider extends ApiProvider with LoadingStatusMixin {
  Category? _currentCategory;
  int _lastPage = 0;

  List<ThreadCategoryItem> _categoryItems = [];
  List<ThreadCategoryItem> get categoryItems => _categoryItems;

  ThreadListProvider(BuildContext context) : super(context);

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
      _categoryItems = [];
      fetchRequest(() async {
        final response = await webServices.getThreadList(category, page: 1);
        _lastPage = 1;
        _categoryItems = response.items;
        _currentCategory = category;
      });
    }
  }

  loadMore() async {
    final category = _currentCategory;
    if (category == null) {
      return;
    }

    fetchRequest(() async {
      final nextPage = _lastPage + 1;
      final response = await webServices.getThreadList(category, page: nextPage);
      _lastPage = nextPage;
      _categoryItems.addAll(response.items);
      notifyListeners();
    });

  }

}