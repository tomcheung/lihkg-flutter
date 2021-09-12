import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../core/lihkg_webservices.dart';
import './app_provider.dart';

abstract class ApiProvider extends ChangeNotifier {
  final LihkgWebServices webServices;

  ApiProvider(BuildContext context) : this.webServices = context.read<AppProvider>().webServices;
}