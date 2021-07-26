import 'package:flutter/cupertino.dart';
import 'package:lihkg_flutter/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/category.dart';
import 'package:lihkg_flutter/model/thread_category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  Category? _selectedCategory;
  Category? get selectedCategory => _selectedCategory;
  List<ThreadCategoryItem> categoryItems = [];

  set selectedCategory(Category? category) {
    _getThreadCategoryItems(category);
  }

  Future<void> _getThreadCategoryItems(Category? category) async {
    if (category != null) {
      final response = await LihkgWebServices().getThreadCategory(catId: category.catId, page: 1);
      categoryItems = response.items;
      notifyListeners();
    } else {
      _selectedCategory = null;
      categoryItems = [];
      notifyListeners();
    }
  }

  Future<void> getSystemProperty() async {
    final response = await LihkgWebServices().getSystemProperty();
    categories = response.categoryList;
    notifyListeners();
  }
}