import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/app_theme.dart';
import 'package:lihkg_flutter/core/route/navigator/lihkg_navigator.dart';
import 'package:lihkg_flutter/screen/root/splash_page.dart';

import 'screen/root/app_config_provider.dart';

void main() {
  runApp(const ProviderScope(child: LiHKGApp()));
}

class LiHKGApp extends ConsumerStatefulWidget {
  @override
  ConsumerState createState() => _LiHKGAppState();

  const LiHKGApp({Key? key}): super(key: key);
}

class _LiHKGAppState extends ConsumerState<LiHKGApp> {
  @override
  Widget build(BuildContext context) {
    final isInit = ref.watch(appInitialLoadedProvider);
    if (isInit) {
      return const LihkgAppRoot();
    } else {
      return const SplashScreen();
    }
  }
}

class LihkgAppRoot extends ConsumerStatefulWidget {
  const LihkgAppRoot({super.key});

  @override
  ConsumerState<LihkgAppRoot> createState() => _LihkgAppRootState();
}

class _LihkgAppRootState extends ConsumerState<LihkgAppRoot> {
  late LihkgNavigationRouteDelegate _routeDelegate;

  @override
  void initState() {
    _routeDelegate = LihkgNavigationRouteDelegate(ref);
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
