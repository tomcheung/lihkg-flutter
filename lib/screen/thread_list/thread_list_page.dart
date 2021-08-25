import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lihkg_flutter/model/thread_category.dart';
import 'package:lihkg_flutter/core/route/app_router.dart';
import 'package:lihkg_flutter/screen/root/category_provider.dart';
import 'package:provider/provider.dart';
import 'thread_list_provider.dart';
import 'thread_list_item.dart';

class LihkgDrawerIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  LihkgDrawerIconButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      color: theme.primaryIconTheme.color,
      icon: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform(
              child: const Align(
                alignment: Alignment.centerLeft,
                widthFactor: 0.5,
                child: Icon(Icons.menu),
              ),
              transform: Matrix4.translationValues(-35, 0, 0),
            ),
            SvgPicture.asset(
              'assets/lihkg_logo.svg',
              height: 24,
              width: 24,
            )
          ],
        ),
      ),
      onPressed: onPressed,
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
  }
}

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

  void _handleDrawerButton() {
    final scaffold = Scaffold.of(context);
    scaffold.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<CategoryProvider>();
    final backgroundColor = Theme.of(context).cardColor;

    _buildSeparator(BuildContext context, int index) {
      return const Divider();
    }

    _threadListProvider.getThreadList(categoryProvider.selectedCategory);
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        leading: LihkgDrawerIconButton(_handleDrawerButton),
        title: Text(categoryProvider.selectedCategory?.name ?? ''),
      ),
      body: Container(
        color: backgroundColor,
        child: ChangeNotifierProvider.value(
          value: _threadListProvider,
          builder: (context, child) {
            final categoryItems =
                context.watch<ThreadListProvider>().categoryItems;
            return ListView.separated(
              key: ObjectKey(categoryProvider.selectedCategory?.catId),
              itemBuilder: (context, index) {
                if (index == categoryItems.length - 1) {
                  _threadListProvider.loadMore();
                }
                return TextButton(
                  child: ThreadListItem(
                    item: categoryItems[index],
                    key: ObjectKey(categoryItems[index]),
                  ),
                  onPressed: _handleItemPress(context, categoryItems[index]),
                );
              },
              separatorBuilder: _buildSeparator,
              itemCount: categoryItems.length,
            );
          },
        ),
      ),
    );
  }
}
