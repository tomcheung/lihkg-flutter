import 'package:flutter/material.dart';
import 'package:lihkg_flutter/screen/root/splash_page.dart';
import 'package:provider/provider.dart';

import 'core/app_theme.dart';
import 'core/route/app_router.dart';
import 'screen/root/category_provider.dart';

void main() {
  runApp(LiHKGApp());
}

class LiHKGApp extends StatefulWidget {
  @override
  _LiHKGAppState createState() => _LiHKGAppState();
}

class _LiHKGAppState extends State<LiHKGApp> {
  AppThemeData _appThemeData = AppThemeData.light;
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

  _updateTheme(AppThemeData newThemeData) {
    setState(() {
      _appThemeData = newThemeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _categoryProvider,
      child: AppTheme(
        theme: _appThemeData,
        onThemeUpdated: _updateTheme,
        child: Consumer<CategoryProvider>(
          builder: (context, categoryProvider, child) {
            if (categoryProvider.categories.isEmpty) {
              return SplashScreen();
            } else {
              return child ?? Container();
            }
          },
          child: MaterialApp.router(
            routeInformationParser: _routeInformationParser,
            routerDelegate: _routerDelegate,
            theme: _appThemeData.materialThemeData,
          ),
        ),
      ),
    );
  }
}
