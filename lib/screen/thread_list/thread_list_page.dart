import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lihkg_flutter/core/route/navigator/lihkg_root_navigator.dart';
import 'package:lihkg_flutter/screen/root/app_config_provider.dart';
import 'thread_list_item_skeleton.dart';
import 'package:provider/provider.dart';
import 'thread_list_provider.dart';
import 'thread_list_item.dart';

class LihkgDrawerIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LihkgDrawerIconButton(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      color: theme.primaryIconTheme.color,
      icon: Stack(
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
  late ThreadListProvider _threadListProvider;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _threadListProvider.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _threadListProvider = ThreadListProvider(context);
    AppConfigProvider categoryProvider = context.read();
    if (categoryProvider.categories.isNotEmpty) {
      final firstCategory = categoryProvider.categories.first;
      categoryProvider.selectedCategory = firstCategory;
    }
  }

  void _handleDrawerButton() {
    final scaffold = Scaffold.of(context);
    scaffold.openDrawer();
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return const Divider();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<AppConfigProvider>();
    final backgroundColor = Theme.of(context).cardColor;

    _threadListProvider.getThreadList(categoryProvider.selectedCategory);
    return Scaffold(
      appBar: AppBar(
        leading: LihkgDrawerIconButton(_handleDrawerButton),
        title: Text(categoryProvider.selectedCategory?.name ?? ''),
      ),
      body: Container(
        color: backgroundColor,
        child: ChangeNotifierProvider.value(
          value: _threadListProvider,
          builder: (context, child) {
            final provider = context.watch<ThreadListProvider>();
            final categoryItems = provider.categoryItems;

            if (provider.isLoading && categoryItems.isEmpty) {
              return ListView.separated(
                separatorBuilder: _buildSeparator,
                itemBuilder: (context, index) => const ThreadListItemSkeleton(),
                itemCount: 40,
              );
            }

            return ListView.separated(
              controller: _scrollController,
              key: ObjectKey(categoryProvider.selectedCategory?.catId),
              itemBuilder: (context, index) {
                final item = categoryItems[index];
                if (index == categoryItems.length - 1) {
                  _threadListProvider.loadMore();
                }
                return TextButton(
                    child: ThreadListItem(
                      item: item,
                      key: ObjectKey(item.threadId),
                    ),
                    onPressed: () {
                      context
                          .read<LihkgRootNavigatorProvider>()
                          .showThreadContent(item);
                    });
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
