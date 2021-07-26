import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final _threadContentProvider = ThreadContentProvider();

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: _threadContentProvider,
        builder: (context, child) {
          final provider = context.watch<ThreadContentProvider>();
          var threadId = provider.category?.threadId;

          if (provider.isLoading) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  ThreadContentItem(data: provider.itemData[index]),
              itemCount: provider.itemData.length,
              key: threadId != null ? ObjectKey(threadId) : null,
            );
          }
        },
      ),
    );
  }
}
