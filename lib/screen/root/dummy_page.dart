import 'package:flutter/material.dart';
import 'package:lihkg_flutter/screen/root/drawer.dart';

class DummyPage extends StatelessWidget {
  final String message;
  const DummyPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Container(
        child: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
