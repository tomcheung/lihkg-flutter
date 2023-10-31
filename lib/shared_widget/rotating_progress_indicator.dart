import 'package:flutter/material.dart';

class RotatingProgressIndicator extends StatefulWidget {
  final double size;
  final Color color;

  const RotatingProgressIndicator({
    this.size = 24.0,
    this.color = Colors.blue,
  });

  @override
  _RotatingProgressIndicatorState createState() =>
      _RotatingProgressIndicatorState();
}

class _RotatingProgressIndicatorState extends State<RotatingProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(widget.color),
        ),
      ),
    );
  }
}