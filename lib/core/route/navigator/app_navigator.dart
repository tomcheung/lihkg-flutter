import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:provider/provider.dart';
import '../page_state/page_state.dart';
import '../../../screen/root/dummy_page.dart';
import '../../../util/adaptive_layout/layout_adapter.dart';
import '../../app_theme.dart';

abstract class AppNavigator<NavigatorProvider extends AppNavigatorProvider>
    extends ConsumerStatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavigatorState<NavigatorProvider>();

  NavigatorProvider createProvider(BuildContext context);
}

abstract class AppNavigatorProvider {
  @protected
  NavigatorRouterDelegate routerDelegate;

  @protected
  PageState initialPageState;

  LayoutSize get layoutSize => routerDelegate._layoutSize;

  AppNavigatorProvider({required this.initialPageState})
      : routerDelegate = NavigatorRouterDelegate(initialPageState);
}

class LihkgRouteInformationParser extends RouteInformationParser<PageState> {
  PageState homePageState;

  LihkgRouteInformationParser(this.homePageState);

  @override
  Future<PageState> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.location) {
      case '/':
        return homePageState;

      default:
        return DefaultPageState(
          name: 'notFound',
          content: const DummyPage(message: 'Not found'),
        );
    }
  }
}

class _NavigatorState<NavigatorProvider extends AppNavigatorProvider>
    extends ConsumerState<AppNavigator<NavigatorProvider>> {
  late LihkgRouteInformationParser _routeInformationParser;
  late NavigatorProvider _provider;

  @override
  void initState() {
    _provider = widget.createProvider(context);
    _routeInformationParser =
        LihkgRouteInformationParser(_provider.initialPageState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider);
    AppThemeData appThemeData = appTheme.value ?? AppThemeData.light;

    return Provider.value(
      value: _provider,
      child: MaterialApp.router(
        routeInformationParser: _routeInformationParser,
        routerDelegate: _provider.routerDelegate,
        theme: appThemeData.materialThemeData,
      ),
    );
  }
}

class NavigatorRouterDelegate extends RouterDelegate<PageState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  LayoutSize _layoutSize = LayoutSize.large;
  List<PageState> _pageState = [];
  final PageState initialPageState;

  NavigatorRouterDelegate(this.initialPageState);

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
