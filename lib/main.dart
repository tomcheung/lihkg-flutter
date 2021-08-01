import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_theme.dart';
import 'route/app_router.dart';
import 'screen/root/category_provider.dart';

void main() {
  runApp(LiHKGApp());
}

class LiHKGApp extends StatefulWidget {
  @override
  _LiHKGAppState createState() => _LiHKGAppState();
}

class _LiHKGAppState extends State<LiHKGApp> {
  AppRouterDelegate _routerDelegate = AppRouterDelegate();
  CategoryProvider _categoryProvider = CategoryProvider();
  LihkgRouteInformationParser _routeInformationParser =
      LihkgRouteInformationParser();

  @override
  void initState() {
    super.initState();
    _categoryProvider.getSystemProperty();
  }

  @override
  void dispose() {
    _categoryProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _categoryProvider,
      child: MaterialApp.router(
        routeInformationParser: _routeInformationParser,
        routerDelegate: _routerDelegate,
        theme: LiHkgAppTheme.light,
      ),
    );
  }
}
