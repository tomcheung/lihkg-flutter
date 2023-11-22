import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lihkg_flutter/core/app_theme.dart';
import 'package:lihkg_flutter/core/settings/settings.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {

  AppThemeData _getSelectedTheme(String themeName) {
    return [AppThemeData.light, AppThemeData.dark].firstWhere((t) => t.name == themeName);
  }

  @override
  Widget build(BuildContext context) {
    final pref = ref.watch(userSettingProvider);
    final prefNotifier = ref.watch(userSettingProvider.notifier);

    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, minWidth: 300),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('設定'),
            automaticallyImplyLeading: false,
            actions: [
              CloseButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Card(
                child: ListTile(
                  leading: const Text('配色'),
                  trailing: SegmentedButton<AppThemeData>(
                    segments: [
                      ButtonSegment(
                          value: AppThemeData.light,
                          label: const Text('淺色')),
                      ButtonSegment(
                          value: AppThemeData.dark,
                          label: const Text('深色')),
                    ],
                    selected: {_getSelectedTheme(pref.appThemeName)},
                    onSelectionChanged: (newSelection) {
                      prefNotifier.setTheme(newSelection.first);
                    },
                  ),
                ),
              ),
              const _SectionHeader(title: '內文顯示'),
              Card(
                child: ListTile(
                  leading: const Text('字體大小'),
                  title: Slider(
                    value: pref.contentFontSize.toDouble(),
                    min: 9,
                    max: 24,
                    divisions: 24 - 9,
                    onChanged: (double value) {
                      prefNotifier.updateFontSize(value.toInt());
                    },
                  ),
                  trailing: Text(pref.contentFontSize.toString()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title, style: style.titleSmall?.apply(fontSizeDelta: 2)),
    );
  }
}
