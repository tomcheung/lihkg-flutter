import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/route/navigator/lihkg_root_navigator.dart';
import 'package:lihkg_flutter/screen/root/splash_page.dart';

import 'screen/root/app_config_provider.dart';

void main() {
  runApp(const ProviderScope(child: LiHKGApp()));
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
