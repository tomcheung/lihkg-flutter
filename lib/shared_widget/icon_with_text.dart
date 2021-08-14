import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool textFirst;
  final Color? color;

  const IconWithText({
    Key? key,
    required this.text,
    required this.iconData,
    this.color,
    this.textFirst = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subtitleStyle = theme.textTheme.subtitle2;
    final color = this.color ?? theme.colorScheme.onSurface.withOpacity(0.3);

    var items = [
      Icon(iconData, color: color, size: 11,),
      const SizedBox(width: 2),
      Text(text, style: subtitleStyle),
    ];

    if (textFirst) {
      items = items.reversed.toList(growable: false);
    }

    return Row(children: items);
  }
}
