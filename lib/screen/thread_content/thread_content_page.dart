import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/route/app_router.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';
import 'package:provider/provider.dart';
import 'image_size_cache_provider.dart';
import 'thread_content_item.dart';
import '../../model/thread_category.dart';
import './thread_content_provider.dart';

class ThreadContentPage extends StatefulWidget {
  final ThreadCategoryItem? categoryItem;

  const ThreadContentPage({Key? key, this.categoryItem}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: router.layoutSize == LayoutSize.Compact,
        title: Text(widget.categoryItem?.title ?? ''),
        centerTitle: false,
      ),
      body: Provider(
        create: (ctx) => ImageSizeCacheProvider(),
        child: ChangeNotifierProvider.value(
          value: _threadContentProvider,
          builder: (context, child) {
            final provider = context.watch<ThreadContentProvider>();
            var items = provider.itemData;

            if (provider.isLoading && items.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index + 1 >= items.length) {
                    provider.loadNextPage();
                  }
                  return ThreadContentItem(
                    index: index + 1,
                    data: items[index],
                    key: ObjectKey(items[index].postId),
                  );
                },
                itemCount: items.length,
              );
            }
          },
        ),
      ),
    );
  }
}
