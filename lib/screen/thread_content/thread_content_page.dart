import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './thread_content_provider.dart';
import '../../core/route/navigator/lihkg_root_navigator.dart';
import '../../model/thread_category.dart';
import '../../util/adaptive_layout/layout_adapter.dart';
import 'thread_content_item.dart';
import 'thread_content_skeleton.dart';

class ThreadContentPage extends ConsumerStatefulWidget {
  final ThreadCategoryItem? categoryItem;

  const ThreadContentPage({super.key, this.categoryItem});

  @override
  ConsumerState createState() => _ThreadContentPageState();
}

class _ThreadContentPageState extends ConsumerState<ThreadContentPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleLoadMore);
  }

  _handleLoadMore() {
    if (_scrollController.position.extentAfter > 300) {
      return;
    }

    final categoryItem = widget.categoryItem;
    if (categoryItem == null) {
      return;
    }

    final notifier = ref.read(threadContentProvider(categoryItem).notifier);
    notifier.fetchNextPage();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _buildItem(BuildContext context, ThreadItem item) {
    if (item is ThreadItemContent) {
      return ThreadContentItem(
        index: int.parse(item.post.msgNum),
        data: item.post,
        key: ObjectKey(item.post.postId),
      );
    } else if (item is ThreadItemPageIndicator) {
      return ThreadContentPageIndicator(page: item.page);
    } else {
      return Container(height: 0);
    }
  }

  Widget? _buildEndDrawer(BuildContext context) {
    final categoryItem = widget.categoryItem;

    if (categoryItem == null) {
      return null;
    }

    return ThreadContentPageDrawer(categoryItem: categoryItem);
  }

  Widget _buildSkeleton() {
    return ListView(
      children: List.filled(12, const ThreadContentSkeleton()),
    );
  }

  Widget _buildContent(BuildContext context) {
    final categoryItem = widget.categoryItem;
    if (categoryItem == null) {
      return _buildSkeleton();
    }

    final threadContent = ref.watch(threadContentProvider(categoryItem));

    return threadContent.when(
      data: (threadContentsState) {
        final items = threadContentsState.items;
        return ListView.builder(
          controller: _scrollController,
          itemCount: items.length,
          itemBuilder: (context, index) => _buildItem(context, items[index]),
        );
      },
      error: (err, stack) => _buildSkeleton(),
      loading: _buildSkeleton,
    );
  }

  @override
  Widget build(BuildContext context) {
    final layoutSize = LihkgRootNavigator.of(context).layoutSize;
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final showBackButton = layoutSize == LayoutSize.compact && canPop;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryItem?.title ?? ''),
        centerTitle: false,
        leading: showBackButton ? const BackButton() : null,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.forward_5),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          )
        ],
      ),
      endDrawer: _buildEndDrawer(context),
      body: _buildContent(context),
    );
  }
}
