import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Consumer;
import 'package:lihkg_flutter/core/app_theme.dart';
import 'package:lihkg_flutter/core/navigation/main/lihkg_navigation_provider.dart';
import 'package:lihkg_flutter/core/settings/settings.dart';
import 'package:lihkg_flutter/screen/root/app_config_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _ThemeToggle extends ConsumerWidget {
  const _ThemeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final iconColor = theme.iconTheme.color;
    final appTheme = ref.watch(appThemeProvider);

    return IconButton(
      color: iconColor,
      icon: Icon(
        appTheme.name == AppThemeData.light.name
            ? Icons.wb_sunny
            : Icons.nights_stay,
        size: AppDrawer._iconSize,
      ),
      onPressed: () {
        _toggleTheme(context, ref);
      },
    );
  }

  _toggleTheme(BuildContext context, WidgetRef ref) async {
    final appThemeNotifier = ref.read(userSettingProvider.notifier);
    appThemeNotifier.toggleTheme();
  }
}

class _SettingButton extends ConsumerWidget {
  const _SettingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final iconColor = theme.iconTheme.color;

    return IconButton(
      color: iconColor,
      icon: const Icon(Icons.settings, size: AppDrawer._iconSize),
      onPressed: () {
        ref.read(lihkgNavigationStateProvider.notifier).showSetting();
      },
    );
  }
}

class _AppDrawerSideBar extends StatelessWidget {
  const _AppDrawerSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 50,
        color: Colors.grey.withAlpha(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDrawer._iconPadding),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/lihkg_logo.svg',
                height: AppDrawer._iconSize,
                width: AppDrawer._iconSize,
              ),
              const Spacer(),
              const _ThemeToggle(),
              const SizedBox(height: AppDrawer._iconPadding),
              const _SettingButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  static const double _iconSize = 26;
  static const double _iconPadding = 16;

  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      child: Drawer(
        child: Row(
          children: [
            _AppDrawerSideBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: _iconPadding),
                child: CategoriesList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesList extends ConsumerWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(threadCategoriesProvider);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) => TextButton(
        onPressed: () {
          final selectedCategoryNotifier =
              ref.read(selectedCategoryStateProvider.notifier);
          selectedCategoryNotifier.state = categories[index];
          Navigator.pop(context);
        },
        child: Text(
          categories[index].name,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
