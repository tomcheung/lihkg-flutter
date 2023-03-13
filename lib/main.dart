import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:lihkg_flutter/core/app_provider.dart';
import 'package:lihkg_flutter/core/lihkg_webservices.dart';
import 'package:lihkg_flutter/core/route/navigator/lihkg_root_navigator.dart';
import 'package:lihkg_flutter/screen/root/splash_page.dart';
import 'package:provider/provider.dart';

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
  runApp(const ProviderScope(child: LiHKGAppLoader()));
}

@Deprecated('Remove after migrate to riverpod')
class LiHKGAppLoader extends StatelessWidget {

  const LiHKGAppLoader({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return AppProvider(
            webServicesConfig: LihkgWebServicesConfig.defaultConfig);
      },
      child: const LiHKGApp(),
    );
  }
}

@immutable
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
      return const LihkgRootNavigator();
    } else {
      return const SplashScreen();
    }
  }
}
