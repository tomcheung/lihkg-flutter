import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/app_theme.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';
import '../../model/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/system_property.dart';

part 'app_config_provider.g.dart';

@Riverpod(keepAlive: true)
class AppSystemProperty extends _$AppSystemProperty {
  @override
  FutureOr<SystemProperty> build() async {
    try {
      final webServices = ref.watch(lihkgWebServicesProvider);
      final response = await webServices.getSystemProperty();

      // Load first category as default
      final selectedCategoryNotifier = ref.read(selectedCategoryStateProvider.notifier);
      selectedCategoryNotifier.state = response.categoryList.first;
      return response;
    } catch (error, stackTrace) {
      print('Error in AppSystemProperty build: $error');
      print(stackTrace);
      rethrow;
    }
  }
}
final threadCategoriesProvider = Provider<List<Category>>((ref) {
  final systemPropertyProvider = ref.watch(appSystemPropertyProvider);
  return systemPropertyProvider.value?.categoryList ?? [];
});

final appInitialLoadedProvider = Provider<bool>((ref) {
  final systemPropertyLoaded = ref.watch(appSystemPropertyProvider.select((systemProperty) => systemProperty.hasValue));
  final appThemeLoaded = ref.watch(appThemeProvider.select((appTheme) => appTheme.hasValue));
  return systemPropertyLoaded && appThemeLoaded;
});

final selectedCategoryStateProvider = StateProvider<Category?>((ref) => null);