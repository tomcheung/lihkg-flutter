import 'package:flutter/foundation.dart' hide Category;
import '../../model/category.dart';
import '../../lihkg_webservices.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  Category? _selectedCategory;

  Category? get selectedCategory => _selectedCategory;
  set selectedCategory(Category? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Future<void> getSystemProperty() async {
    final response = await LihkgWebServices().getSystemProperty();
    categories = response.categoryList;
    notifyListeners();
  }
}