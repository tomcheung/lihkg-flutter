import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/route/dialog_page.dart';
import 'package:lihkg_flutter/core/route/navigator/lihkg_navigation_provider.dart';
import 'package:lihkg_flutter/core/route/navigator/quote_navigation_provider.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/screen/quote/quote_dialog.dart';
import 'package:lihkg_flutter/util/adaptive_layout/layout_adapter.dart';
import '../../../util/adaptive_layout/screen_info.dart';
import '../page_state/page_state.dart';

class LihkgNavigationRouteDelegate
    extends RouterDelegate<LihkgNavigationStateData>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<LihkgNavigationStateData> {
  WidgetRef widgetRef;
  LihkgNavigationStateData navigationState = LihkgNavigationStateData();
  QuoteNavigationStateData quoteState = QuoteNavigationStateData();
  final List<ProviderSubscription> _subscriptions = [];

  LihkgNavigationRouteDelegate(this.widgetRef) {
    _subscriptions.add(
      widgetRef.listenManual<LihkgNavigationStateData>(
          lihkgNavigationStateProvider, (previous, next) {
        navigationState = next;
        notifyListeners();
      }),
    );

    _subscriptions.add(
      widgetRef.listenManual<QuoteNavigationStateData>(
          quoteNavigationStateProvider, (previous, next) {
        if (previous == null ||
            previous.quoteStack.firstOrNull != next.quoteStack.firstOrNull) {
          quoteState = next;
          notifyListeners();
        }
      }),
    );
  }

  @override
  final GlobalKey<NavigatorState>? navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutAdapter(
        builder: (BuildContext context, LayoutSize size, Widget? child) {
      return ScreenInfo(
        layoutSize: size,
        child: Navigator(
          key: navigatorKey,
          pages: _buildPage(size),
          onPopPage: pop,
        ),
      );
    });
  }

  bool pop(Route route, result) {

    if (!route.didPop(result)) {
      return false;
    }

    if (route is DialogRoute<QuoteNavigationStateData>) {
      // Flush quote navigator state, when the state clear, _buildPage will remove the quote dialog
      widgetRef.read(quoteNavigationStateProvider.notifier).dismiss();
      return true;
    } else {
      return widgetRef.read(lihkgNavigationStateProvider.notifier).pop();
    }
  }

  @override
  Future<void> setNewRoutePath(LihkgNavigationStateData configuration) async {
    return;
  }

  List<Page> _buildPage(LayoutSize layoutSize) {
    var pages = LihkgRootPageState(navigationState.selectedCategoryItem)
        .buildPage(layoutSize);

    pages.addAll(
        navigationState.pages.expand((page) => page.buildPage(layoutSize)));

    if (quoteState.quoteStack.isNotEmpty) {
      final rootItem = quoteState.quoteStack.first;
      pages.add(
        DialogPage<QuoteNavigationStateData>(builder: (context) => QuoteDialog(initialPost: rootItem as Post)),
      );
    }

    return pages;
  }

  @override
  void dispose() {
    for (var s in _subscriptions) {
      s.close();
    }
    super.dispose();
  }
}
