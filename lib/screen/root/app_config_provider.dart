import 'package:flutter/widgets.dart';
import 'package:lihkg_flutter/core/api_provider.dart';
import 'package:lihkg_flutter/core/app_theme.dart';
import 'package:lihkg_flutter/screen/root/user_preference.dart';
import '../../model/category.dart';

class AppConfigProvider extends ApiProvider {
  List<Category> categories = [];
  Category? _selectedCategory;
  UserPreference _userPreference = UserPreference(appTheme: AppThemeData.light);
  UserPreference get userPreference => _userPreference;

  bool _isInit = false;
  bool get isInit => _isInit;

  Category? get selectedCategory => _selectedCategory;
  set selectedCategory(Category? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  AppConfigProvider(BuildContext context) : super(context);

  init() async {
    await getSystemProperty();
    await loadUserPreference();
    _isInit = true;

    if (categories.isNotEmpty) {
      final firstCategory = categories.first;
      _selectedCategory = firstCategory;
    }

    notifyListeners();
  }

  Future<void> getSystemProperty() async {
    final response = await webServices.getSystemProperty();
    categories = response.categoryList;
    notifyListeners();
  }

  loadUserPreference() async {
    _userPreference = await UserPreference.loadFromSharedPreferences();
    notifyListeners();
  }

  setTheme(AppThemeData appTheme) {
    _userPreference.appTheme = appTheme;
  }
}