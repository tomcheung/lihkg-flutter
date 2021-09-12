import 'package:flutter/widgets.dart';
import 'package:lihkg_flutter/core/api_provider.dart';
import '../../model/category.dart';

class CategoryProvider extends ApiProvider {
  List<Category> categories = [];
  Category? _selectedCategory;

  Category? get selectedCategory => _selectedCategory;
  set selectedCategory(Category? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  CategoryProvider(BuildContext context) : super(context);

  Future<void> getSystemProperty() async {
    final response = await webServices.getSystemProperty();
    categories = response.categoryList;
    notifyListeners();
  }
}