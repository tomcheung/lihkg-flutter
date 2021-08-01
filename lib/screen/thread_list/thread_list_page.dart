import 'package:flutter/material.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/route/app_router.dart';
import 'package:lihkg_flutter/screen/root/category_provider.dart';
import 'package:provider/provider.dart';
import 'thread_list_provider.dart';
import 'thread_list_item.dart';

class ThreadListPage extends StatefulWidget {
  const ThreadListPage({Key? key}) : super(key: key);

  @override
  _ThreadListPageState createState() => _ThreadListPageState();
}

class _ThreadListPageState extends State<ThreadListPage> {
  ThreadListProvider _threadListProvider = ThreadListProvider();
  VoidCallback _handleItemPress(
    BuildContext context,
    ThreadCategoryItem item,
  ) =>
      () {
        AppRouter.of(context).showThreadContent(item);
      };

  @override
  void dispose() {
    _threadListProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    final backgroundColor = Theme.of(context).cardColor;

    _threadListProvider.getThreadList(categoryProvider.selectedCategory);
    return Container(
      color: backgroundColor,
      child: ChangeNotifierProvider.value(
        value: _threadListProvider,
        builder: (context, child) {
          final categoryItems = context.watch<ThreadListProvider>().categoryItems;
          return ListView.separated(
            key: ObjectKey(categoryProvider.selectedCategory?.catId),
            itemBuilder: (context, index) {
              if (index == categoryItems.length - 1) {
                _threadListProvider.loadMore();
              }
              return TextButton(
                child: ThreadListItem(item: categoryItems[index], key: ObjectKey(categoryItems[index]),),
                onPressed: _handleItemPress(context, categoryItems[index]),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: categoryItems.length,
          );
        },
      ),
    );
  }
}
