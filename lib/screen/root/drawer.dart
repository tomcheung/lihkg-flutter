import 'package:flutter/material.dart';
import 'package:lihkg_flutter/core/app_theme.dart';
import 'package:lihkg_flutter/screen/root/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _AppDrawerSideBar extends StatelessWidget {
  const _AppDrawerSideBar({Key? key}) : super(key: key);

  _toggleTheme(BuildContext context) {
    final appTheme = AppTheme.of(context);
    if (appTheme.name == AppThemeData.light.name) {
      AppTheme.updateTheme(AppThemeData.dark, context);
    } else {
      AppTheme.updateTheme(AppThemeData.light, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final iconColor = appTheme.materialThemeData.iconTheme.color;
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
              IconButton(
                color: iconColor,
                icon: Icon(
                  appTheme.name == AppThemeData.light.name
                      ? Icons.nights_stay
                      : Icons.wb_sunny,
                  size: AppDrawer._iconSize,
                ),
                onPressed: () {
                  _toggleTheme(context);
                },
              ),
              const SizedBox(height: AppDrawer._iconPadding),
              Icon(
                Icons.settings,
                size: AppDrawer._iconSize,
                color: iconColor
              ),
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
    return SizedBox(
      width: 250,
      child: Drawer(
        child: Row(
          children: [
            const _AppDrawerSideBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: _iconPadding),
                child: Consumer<AppConfigProvider>(
                  builder: (context, categoryProvider, child) =>
                      GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                    ),
                    itemCount: categoryProvider.categories.length,
                    itemBuilder: (context, index) => TextButton(
                      onPressed: () {
                        categoryProvider.selectedCategory =
                            categoryProvider.categories[index];
                        Navigator.pop(context);
                      },
                      child: Text(
                        categoryProvider.categories[index].name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
