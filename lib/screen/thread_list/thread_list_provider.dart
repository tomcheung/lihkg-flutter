import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lihkg_flutter/core/api_provider.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';
import 'package:lihkg_flutter/model/category.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/util/loading_status_mixin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../root/app_config_provider.dart';

part 'thread_list_provider.freezed.dart';
part 'thread_list_provider.g.dart';

@freezed
class ThreadListState with _$ThreadListState {
  factory ThreadListState({
    required List<ThreadCategoryItem> items,
    required String categoryId,
    required int lastPage,
  }) = _ThreadListState;
}

@riverpod
class ThreadList extends _$ThreadList {
  @override
  Future<ThreadListState> build() async {
    final webServices = ref.watch(lihkgWebServicesProvider);
    final selectedCategory = ref.watch(selectedCategoryStateProvider);

    if (selectedCategory != null) {
      final response = await webServices.getThreadList(
          selectedCategory, page: 0);
      return ThreadListState(items: response.items, categoryId: selectedCategory.catId, lastPage: 0);
    } else {
      return ThreadListState(items: [], categoryId: "", lastPage: 0);
    }
  }

  Future<void> loadMore() async {
    final categoryState = state.value;
    final selectedCategory = ref.read(selectedCategoryStateProvider);

    if (categoryState == null || selectedCategory == null) {
      return;
    }

    final webServices = ref.read(lihkgWebServicesProvider);
    final nextPage = categoryState.lastPage + 1;
    final response = await webServices.getThreadList(selectedCategory, page: nextPage);

    var newItems = List<ThreadCategoryItem>.from(categoryState.items);
    newItems.addAll(response.items);
    state = AsyncValue.data(ThreadListState(items: newItems, categoryId: categoryState.categoryId, lastPage: nextPage));
  }
}