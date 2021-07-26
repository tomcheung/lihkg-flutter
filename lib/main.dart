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
  LihkgRouteInformationParser _routeInformationParser =
      LihkgRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
      theme: LiHkgAppTheme.light,
    );
  }
}

class AppContentProvider extends StatelessWidget {
  final Widget child;

  const AppContentProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider()..getSystemProperty(),
        ),
      ],
      child: child,
    );
  }
}