import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/app_provider.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';
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
  LihkgRouteInformationParser _routeInformationParser =
      LihkgRouteInformationParser();

  _updateTheme(AppThemeData newThemeData) {
    setState(() {
      _appThemeData = newThemeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        if (kIsWeb) {
          return AppProvider(
              webServicesConfig: LihkgWebServicesConfig.localHost);
        } else {
          return AppProvider(
              webServicesConfig: LihkgWebServicesConfig.defaultConfig);
        }
      },
      child: ChangeNotifierProvider(
        create: (context) {
          return CategoryProvider(context)..getSystemProperty();
        },
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
      ),
    );
  }
}
