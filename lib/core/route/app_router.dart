import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/route/page_state/page_state.dart';
import 'package:lihkg_flutter/screen/root/dummy_page.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';

import '../../model/thread_category.dart';

abstract class PageState {
  String get name;

  List<Page> buildPage(LayoutSize size);

  bool handlePop(Route route);
}

class AppRouter extends InheritedWidget {
  final AppRouterDelegate _delegate;
  final LayoutSize layoutSize;

  const AppRouter(
      {Key? key,
      required Widget child,
      required AppRouterDelegate delegate,
      required this.layoutSize})
      : _delegate = delegate,
        super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  void showThreadContent(ThreadCategoryItem categoryItem) {
    _delegate.pushOrUpdateLast(LihkgRootPageState(categoryItem));
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
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  LayoutSize _layoutSize = LayoutSize.Large;
  List<PageState> _pageState = [];

  List<Page> _buildPages(LayoutSize size) {
    if (_pageState.isEmpty) {
      return List.unmodifiable(
          [const MaterialPage(child: DummyPage(message: "Init..."))]);
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
      layoutSize: _layoutSize,
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
          builder: () => const DummyPage(message: 'Not found'),
        );
    }
  }
}
