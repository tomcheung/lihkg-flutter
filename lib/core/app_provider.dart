import 'package:lihkg_flutter/core/lihkg_webservices.dart';

class AppProvider {
  LihkgWebServices webServices;

  AppProvider({required LihkgWebServicesConfig webServicesConfig}):
        webServices = LihkgWebServices(webServicesConfig);
}
