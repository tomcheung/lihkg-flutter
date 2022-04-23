import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/app_provider.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';
import 'package:lihkg_flutter/core/route/navigator/lihkg_root_navigator.dart';
import 'package:lihkg_flutter/screen/root/splash_page.dart';
import 'package:provider/provider.dart';

import 'core/app_theme.dart';
import 'screen/root/app_config_provider.dart';

class LiHKGHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = LiHKGHttpOverrides();
  runApp(const LiHKGAppLoader());
}

class LiHKGAppLoader extends StatelessWidget {

  const LiHKGAppLoader({Key? key}): super(key: key);

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
      child: const LiHKGApp(),
    );
  }
}

@immutable
class LiHKGApp extends StatefulWidget {
  @override
  _LiHKGAppState createState() => _LiHKGAppState();

  const LiHKGApp({Key? key}): super(key: key);
}

class _LiHKGAppState extends State<LiHKGApp> {
  // final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  late AppConfigProvider _appConfigProvider;
  // final LihkgRouteInformationParser _routeInformationParser =
  //     LihkgRouteInformationParser();

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
              child: LihkgRootNavigator(),
            );
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}
