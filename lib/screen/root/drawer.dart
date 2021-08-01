import 'package:flutter/material.dart';
import 'package:lihkg_flutter/screen/root/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../thread_list/thread_list_provider.dart';

class _AppDrawerSideBar extends StatelessWidget {
  const _AppDrawerSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 50,
        color: Colors.grey.shade100,
        child: IconTheme(
          data: IconThemeData(size: AppDrawer._iconSize, color: Colors.black26),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppDrawer._iconPadding),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/lihkg_logo.svg',
                  height: AppDrawer._iconSize,
                  width: AppDrawer._iconSize,
                ),
                Spacer(),
                Icon(
                  Icons.nights_stay,
                  size: AppDrawer._iconSize,
                ),
                SizedBox(height: AppDrawer._iconPadding),
                Icon(
                  Icons.settings,
                  size: AppDrawer._iconSize,
                ),
              ],
            ),
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
                child: Consumer<CategoryProvider>(
                  builder: (context, categoryProvider, child) =>
                      GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                    ),
                    itemCount: categoryProvider.categories.length,
                    itemBuilder: (context, index) => TextButton(
                      onPressed: () {
                        categoryProvider.selectedCategory =
                            categoryProvider.categories[index];
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
