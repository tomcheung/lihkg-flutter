import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'drawer.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  const MainPage({Key? key, required this.child}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _handleDrawerButton() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform(
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.5,
                    child: const Icon(Icons.menu),
                  ),
                  transform: Matrix4.translationValues(-35, 0, 0),
                ),
                SvgPicture.asset(
                  'assets/lihkg_logo.svg',
                  height: 24,
                  width: 24,
                )
              ],
            ),
          ),
          onPressed: _handleDrawerButton,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: const Text("LIHKG"),
      ),
      body: widget.child,
    );
  }
}
