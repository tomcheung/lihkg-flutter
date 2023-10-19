import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final Error error;
  const ErrorMessage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (error is TypeError) {
      return Text('${error.toString()}\n${error.stackTrace}}', style: theme.textTheme.bodySmall,);
    } else {
      return Text(error.toString(), style: theme.textTheme.bodySmall);
    }
  }
}
