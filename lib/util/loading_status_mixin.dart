import 'package:flutter/cupertino.dart';

abstract class LoadingStatusMixin {
  bool isLoading = false;
  notifyListeners();

  fetchRequest(Future<void> Function() fn) async {
    if (isLoading) {
      return;
    }

    try {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        isLoading = true;
        notifyListeners();
      });
      await fn();
    } catch (e, stacktrace) {
      print('fetch data fail $e $stacktrace}');
      throw e;
    } finally {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        isLoading = false;
        notifyListeners();
      });
    }
  }

}