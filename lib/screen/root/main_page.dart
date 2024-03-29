import 'package:flutter/material.dart';

import 'drawer.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  const MainPage({Key? key, required this.child}) : super(key: key);

  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: widget.child,
    );
  }
}
