import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/navigation/quote/quote_navigation_provider.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/screen/quote/quote_page.dart';

import '../../app_theme.dart';

class _QuoteRouteDelegate extends RouterDelegate<QuoteNavigationStateData>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<QuoteNavigationStateData> {
  WidgetRef widgetRef;
  QuoteNavigationStateData navigationStateData;
  final List<ProviderSubscription> subscriptions = [];

  _QuoteRouteDelegate(this.widgetRef, this.navigationStateData) {
    subscriptions.add(
      widgetRef.listenManual<QuoteNavigationStateData>(
          quoteNavigationStateProvider, (previous, next) {
        navigationStateData = next;
        notifyListeners();
      }),
    );
  }

  @override
  final GlobalKey<NavigatorState>? navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final pages =  _buildPage();

    if (pages.isEmpty) {
      return Container();
    }

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: pop,
    );
  }

  @override
  Future<void> setNewRoutePath(QuoteNavigationStateData configuration) async {
    return;
  }

  List<Page> _buildPage() {
    return navigationStateData.quoteStack
        .map((q) => CupertinoPage(child: QuotePage(targetQuote: q)))
        .toList(growable: false);
  }

  bool pop(Route route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    return widgetRef.read(quoteNavigationStateProvider.notifier).pop();
  }

  @override
  void dispose() {
    for (var s in subscriptions) {
      s.close();
    }
    super.dispose();
  }
}

class QuoteNavigator extends ConsumerStatefulWidget {
  final Post initialPost;

  const QuoteNavigator({super.key, required this.initialPost});

  @override
  ConsumerState<QuoteNavigator> createState() => _QuoteNavigatorState();
}

class _QuoteNavigatorState extends ConsumerState<QuoteNavigator> {
  late _QuoteRouteDelegate _routeDelegate;

  @override
  void initState() {
    _routeDelegate = _QuoteRouteDelegate(
      ref,
      QuoteNavigationStateData(quoteStack: [widget.initialPost]),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appThemeData = ref.watch(appThemeProvider).value ?? AppThemeData.light;

    return MaterialApp.router(
      theme: appThemeData.materialThemeData,
      routerDelegate: _routeDelegate,
    );
  }
}
