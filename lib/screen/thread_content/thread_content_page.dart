import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './thread_content_provider.dart';
import '../../core/route/navigator/lihkg_root_navigator.dart';
import '../../model/thread_category.dart';
import '../../util/adaptive_layout/layout_adapter.dart';
import 'image_size_cache_provider.dart';
import 'thread_content_item.dart';
import 'thread_content_skeleton.dart';

class ThreadContentPage extends StatefulWidget {
  final ThreadCategoryItem? categoryItem;

  const ThreadContentPage({super.key, this.categoryItem});

  @override
  _ThreadContentPageState createState() => _ThreadContentPageState();
}

class _ThreadContentPageState extends State<ThreadContentPage> {
  late ThreadContentProvider _threadContentProvider;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _threadContentProvider = ThreadContentProvider(context);
    _loadContent();
  }

  @override
  void didUpdateWidget(covariant ThreadContentPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categoryItem?.threadId != widget.categoryItem?.threadId) {
      _loadContent();
    }
  }

  _loadContent() {
    var categoryItem = widget.categoryItem;
    if (categoryItem != null) {
      _threadContentProvider.loadThreadContent(categoryItem);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _threadContentProvider.dispose();
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

  @override
  Widget build(BuildContext context) {
    final layoutSize = context.watch<LihkgRootNavigatorProvider>().layoutSize;
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final showBackButton = layoutSize == LayoutSize.compact && canPop;

    return ChangeNotifierProvider.value(
      value: _threadContentProvider,
      child: Scaffold(
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
        body: Provider(
          create: (ctx) => ImageSizeCacheProvider(),
          child: Consumer<ThreadContentProvider>(
            builder: (context, provider, child) {
              final items = provider.itemData;
              if (provider.isLoading && items.isEmpty) {
                return ListView(
                  children: List.filled(12, const ThreadContentSkeleton()),
                );
              } else {
                return ListView.builder(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    final items = provider.itemData;

                    if (index + 2 >= items.length) {
                      provider.loadNextPage();
                    }
                    return _buildItem(context, items[index]);
                  },
                  itemCount: items.length,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
