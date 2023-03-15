import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../core/lihkg_webservices.dart';
import './app_provider.dart';

@Deprecated("migrate to riverpod") // TODO: Remove
abstract class ApiProvider extends ChangeNotifier {
  final LihkgWebServices webServices;

  ApiProvider(BuildContext context) : webServices = context.read<AppProvider>().webServices;
}