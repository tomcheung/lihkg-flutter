import 'dart:developer' as developer;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';
import 'package:lihkg_flutter/core/settings/settings.dart';
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
      final selectedCategoryNotifier = ref.read(
          selectedCategoryStateProvider.notifier);
      selectedCategoryNotifier.state = response.categoryList.first;
      return response;
    } catch (error, stackTrace) {
      developer.log('Cannot fetch AppSystemProperty', error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}

final threadCategoriesProvider = Provider<List<Category>>((ref) {
  final systemPropertyProvider = ref.watch(appSystemPropertyProvider);
  return systemPropertyProvider.value?.categoryList ?? [];
});

@Riverpod(keepAlive: true)
Future<bool> appInitialized(AppInitializedRef ref) async {
  try {
    await ref.watch(appSystemPropertyProvider.future);
    await ref.watch(userSettingProvider.notifier).loadSavedSettings();

    return true;
  } catch (error, stackTrace) {
    developer.log('fetch data error', error: error, stackTrace: stackTrace);
    return false;
  }
}

final selectedCategoryStateProvider = StateProvider<Category?>((ref) => null);