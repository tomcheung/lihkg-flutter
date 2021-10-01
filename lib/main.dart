import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/app_provider.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';
import 'package:lihkg_flutter/screen/root/splash_page.dart';
import 'package:provider/provider.dart';

import 'core/app_theme.dart';
import 'core/route/app_router.dart';
import 'screen/root/app_config_provider.dart';

void main() {
  runApp(LiHKGAppLoader());
}

class LiHKGAppLoader extends StatelessWidget {
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
      child: LiHKGApp(),
    );
  }
}

class LiHKGApp extends StatefulWidget {
  @override
  _LiHKGAppState createState() => _LiHKGAppState();
}

class _LiHKGAppState extends State<LiHKGApp> {
  AppRouterDelegate _routerDelegate = AppRouterDelegate();
  late AppConfigProvider _appConfigProvider;
  LihkgRouteInformationParser _routeInformationParser =
      LihkgRouteInformationParser();

  _updateTheme(AppThemeData newThemeData) {
    setState(() {
      _appConfigProvider.setTheme(newThemeData);
    });
  }

  @override
  void initState() {
    super.initState();
    _appConfigProvider = AppConfigProvider(context)..init();
  }

  @override
  void dispose() {
    _appConfigProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _appConfigProvider,
      child: Consumer<AppConfigProvider>(
        builder: (context, provider, child) {
          if (provider.isInit) {
            return AppTheme(
              theme: provider.userPreference.appTheme,
              onThemeUpdated: _updateTheme,
              child: Builder(
                builder: (context) => MaterialApp.router(
                  routeInformationParser: _routeInformationParser,
                  routerDelegate: _routerDelegate,
                  theme: AppTheme.of(context).materialThemeData,
                ),
              ),
            );
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}
