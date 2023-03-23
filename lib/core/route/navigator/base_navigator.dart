import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/route/navigator/navigation_stack_manager.dart';

import '../../app_theme.dart';

abstract class BaseNavigator<Router extends BaseRouter> extends ConsumerWidget {
  const BaseNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    AppThemeData appThemeData = appTheme.value ?? AppThemeData.light;
    final router = getRouter();

    return _RouterHolder(
      router: router,
      child: MaterialApp.router(
        routerDelegate: router.stackManager,
        theme: appThemeData.materialThemeData,
      ),
    );
  }

  Router getRouter();

  static Router of<Router extends BaseRouter>(BuildContext context) {
    final _RouterHolder<Router>? router = context.dependOnInheritedWidgetOfExactType<_RouterHolder<Router>>();
    return router!.router;
  }
}

class _RouterHolder<Router extends BaseRouter> extends InheritedWidget {
  final Router router;

  const _RouterHolder({required super.child, required this.router});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

abstract class BaseRouter {
  final NavigationStateManager stackManager;
  BaseRouter({required this.stackManager});
}
