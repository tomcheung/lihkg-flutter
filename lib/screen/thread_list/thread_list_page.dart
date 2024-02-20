import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lihkg_flutter/core/navigation/main/lihkg_navigation_provider.dart';
import 'package:lihkg_flutter/screen/root/app_config_provider.dart';
import 'thread_list_item_skeleton.dart';
import 'thread_list_provider.dart';
import 'thread_list_item.dart';

class LihkgDrawerIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LihkgDrawerIconButton(this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            transform: Matrix4.translationValues(-35, 0, 0),
            child: const Align(
              alignment: Alignment.centerLeft,
              widthFactor: 0.5,
              child: Icon(Icons.menu),
            ),
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

class ThreadListPage extends ConsumerWidget {
  const ThreadListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = Theme.of(context).cardColor;
    final selectedCategory = ref.watch(selectedCategoryStateProvider);

    return Scaffold(
      appBar: AppBar(
        leading: LihkgDrawerIconButton(() {
          Scaffold.of(context).openDrawer();
        }),
        title: Text(selectedCategory?.name ?? ''),
      ),
      body: Container(
        color: backgroundColor,
        child: selectedCategory != null ? const ThreadListPageContent() : null,
      ),
    );
  }
}

class ThreadListPageContent extends ConsumerStatefulWidget {
  const ThreadListPageContent({super.key});

  @override
  ConsumerState createState() => _ThreadListPageContentState();
}

class _ThreadListPageContentState extends ConsumerState<ThreadListPageContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final threadListState = ref.watch(threadListProvider);

    return threadListState.when(
      data: (threadListState) {
        final categoryItems = threadListState.items;
        return ListView.builder(
          controller: _scrollController,
          key: ObjectKey(threadListState.categoryId),
          itemBuilder: (context, index) {
            final item = categoryItems[index];
            Future.delayed(Duration.zero, () {
              final threadListStateNotifier =
                  ref.read(threadListProvider.notifier);
              if (index == categoryItems.length - 1) {
                threadListStateNotifier.loadMore();
              }
            });
            return ThreadListItem(
                item: item,
                key: ObjectKey(item.threadId),
                onTap: () {
                  ref
                      .read(lihkgNavigationStateProvider.notifier)
                      .showThreadContent(item);
                });
          },
          itemCount: categoryItems.length,
        );
      },
      error: (error, stack) => const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.broken_image),
            Text('線已斷'),
          ],
        ),
      ),
      loading: () => ListView.builder(
        itemBuilder: (context, index) => const ThreadListItemSkeleton(),
        itemCount: 40,
      ),
    );
  }
}
