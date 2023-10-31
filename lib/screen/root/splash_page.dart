import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lihkg_flutter/shared_widget/rotating_progress_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/lihkg_logo.svg',
            height: 100,
          ),
          const SizedBox(height: 32),
          const RotatingProgressIndicator(
            size: 48.0,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
