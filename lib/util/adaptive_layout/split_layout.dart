import 'package:flutter/material.dart';

class SplitLayout extends StatelessWidget {
  final Widget left, right;

  const SplitLayout({
    Key? key,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 300,
          child: this.left,
        ),
        Container(
          width: 1,
          color: theme.dividerColor,
        ),
        Expanded(
          child: right,
        )
      ],
    );
  }
}
