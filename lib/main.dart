import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/app_theme.dart';
import 'package:lihkg_flutter/core/navigation/main/lihkg_navigator.dart';

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
  late LihkgNavigationRouteDelegate _routeDelegate;

  @override
  void initState() {
    _routeDelegate = LihkgNavigationRouteDelegate(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(appInitializedProvider);
    final appThemeData = ref.watch(appThemeProvider);

    return MaterialApp.router(
      theme: appThemeData.materialThemeData,
      routerDelegate: _routeDelegate,
    );
  }
}