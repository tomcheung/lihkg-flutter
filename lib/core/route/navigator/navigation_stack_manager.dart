import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/route/page_state/page_state.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';

class NavigationStateManager extends RouterDelegate<PageState> with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  LayoutSize get layoutSize => _layoutSize;
  LayoutSize _layoutSize = LayoutSize.large;
  List<PageState> _pageState = [];
  final PageState initialPageState;

  NavigationStateManager(this.initialPageState);

  List<Page> _buildPages(LayoutSize size) {
    if (_pageState.isEmpty) {
      return initialPageState.buildPage(size);
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
    return AdaptiveLayoutNotifier(
      onSizeChange: (size) {
        _layoutSize = size;
        notifyListeners();
      },
      child: Navigator(
        key: navigatorKey,
        pages: _buildPages(_layoutSize),
        onPopPage: pop,
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
    if (_pageState.isNotEmpty && _pageState.last.runtimeType == pageState.runtimeType) {
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