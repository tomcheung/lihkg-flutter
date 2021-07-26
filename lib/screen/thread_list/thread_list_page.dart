import 'package:flutter/material.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/route/app_router.dart';
import 'package:provider/provider.dart';
import '../root/category_provider.dart';
import '../thread_content/thread_content_provider.dart';

import 'thread_list_item.dart';

class ThreadListPage extends StatelessWidget {
  const ThreadListPage({Key? key}) : super(key: key);

  VoidCallback _handleItemPress(
    BuildContext context,
    ThreadCategoryItem item,
  ) =>
      () {
        AppRouter.of(context).showThreadContent(item);
      };

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).cardColor;

    return Container(
      color: backgroundColor,
      child: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
          final categoryItems = categoryProvider.categoryItems;
          return ListView.separated(
            itemBuilder: (context, index) => TextButton(
              child: ThreadListItem(item: categoryItems[index], key: ObjectKey(categoryItems[index]),),
              onPressed: _handleItemPress(context, categoryItems[index]),
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: categoryItems.length,
          );
        },
      ),
    );
  }
}
