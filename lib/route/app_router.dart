import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:lihkg_flutter/screen/root/dummy_page.dart';
import 'package:lihkg_flutter/screen/root/main_page.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_page.dart';
import 'package:lihkg_flutter/screen/thread_list/thread_list_page.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';
import 'package:lihkg_flutter/util/adaptive_layout/split_layout.dart';
import '../model/thread_category.dart';

abstract class PageState {
  String get name;

  List<Page> buildPage(LayoutSize size);
  bool handlePop(Route route);
}

class DefaultPageState extends PageState {
  final String name;
  final Widget Function() builder;
  final Widget _body;

  DefaultPageState({required this.name, required this.builder})
      : _body = builder();

  @override
  List<Page> buildPage(LayoutSize size) {
    return [MaterialPage(child: _body)];
  }

  @override
  bool handlePop(Route route) {
    return false;
  }
}

class LihkgRootPageState extends PageState {
  ThreadCategoryItem? selectedCategoryItem;

  @override
  final String name;

  LihkgRootPageState(this.selectedCategoryItem)
      : name =
            "LihkgRoot ${selectedCategoryItem?.title ?? 'null'}";

  @override
  bool handlePop(Route route) {
    if (selectedCategoryItem != null) {
      selectedCategoryItem = null;
      return true;
    } else {
      return false;
    }
  }

  @override
  List<Page> buildPage(LayoutSize size) {
    switch (size) {
      case LayoutSize.Large:
        return [
          MaterialPage(
            child: MainPage(
              child: SplitLayout(
                left: ThreadListPage(),
                right: ThreadContentPage(categoryItem: selectedCategoryItem),
              ),
            ),
          )
        ];

      case LayoutSize.Compact:
        return [
          MaterialPage(
            child: MainPage(
              child: ThreadListPage(),
            ),
          ),
          if (selectedCategoryItem != null)
            MaterialPage(
              child: Scaffold(
                appBar: AppBar(),
                body: ThreadContentPage(categoryItem: selectedCategoryItem),
              ),
            ),
        ];
    }
  }
}

class AppRouter extends InheritedWidget {
  final AppRouterDelegate _delegate;

  AppRouter({
    Key? key,
    required Widget child,
    required AppRouterDelegate delegate,
  })  : _delegate = delegate,
        super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  void showThreadContent(ThreadCategoryItem categoryItem) {
    this._delegate.pushOrUpdateLast(LihkgRootPageState(categoryItem));
  }

  static AppRouter of(BuildContext context) {
    final AppRouter? result =
        context.dependOnInheritedWidgetOfExactType<AppRouter>();
    assert(result != null, 'No AppRouter found in context');
    return result!;
  }
}

class AppRouterDelegate extends RouterDelegate<PageState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageState> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  LayoutSize _layoutSize = LayoutSize.Large;
  List<PageState> _pageState = [];

  List<Page> _buildPages(LayoutSize size) {
    if (_pageState.isEmpty) {
      return List.unmodifiable(
          [MaterialPage(child: DummyPage(message: "Init..."))]);
    }
    return List.unmodifiable(_pageState.expand((s) => s.buildPage(size)));
  }

  @override
  Future<void> setInitialRoutePath(PageState configuration) {
    _pageState = [configuration];
    return SynchronousFuture(null);
  }

  @override
  Widget build(BuildContext context) {
    return AppRouter(
      delegate: this,
      child: AdaptiveLayoutNotifier(
        onSizeChange: (size) {
          _layoutSize = size;
          notifyListeners();
        },
        child: Navigator(
          key: navigatorKey,
          pages: _buildPages(_layoutSize),
          onPopPage: pop,
        ),
      ),
    );
  }

  bool pop(Route route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (_pageState.isEmpty) {
      return false;
    }

    final isHandleByRouteState = _pageState.last.handlePop(route);
    if (isHandleByRouteState) {
      notifyListeners();
    } else {
      _pageState.removeLast();
    }
    return true;
  }

  replaceLast(PageState pageState) {
    if (_pageState.isEmpty) {
      return;
    }

    _pageState
      ..removeLast()
      ..add(pageState);

    notifyListeners();
  }

  pushOrUpdateLast(PageState pageState) {
    if (_pageState.last.runtimeType == pageState.runtimeType) {
      replaceLast(pageState);
    } else {
      push(pageState);
    }
  }

  push(PageState pageState) {
    _pageState.add(pageState);
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(PageState configuration) async {
    print(configuration);
    // TODO: implement setNewRoutePath
    // throw UnimplementedError();
  }
}

class LihkgRouteInformationParser extends RouteInformationParser<PageState> {
  @override
  Future<PageState> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.location) {
      case '/':
        return LihkgRootPageState(null);

      default:
        return DefaultPageState(
          name: 'notFound',
          builder: () => DummyPage(message: 'Not found'),
        );
    }
  }
}
