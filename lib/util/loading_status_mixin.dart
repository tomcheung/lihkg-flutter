
abstract class LoadingStatusMixin {
  bool isLoading = false;
  notifyListeners();

  fetchRequest(Future<void> Function() fn) async {
    if (isLoading) {
      return;
    }

    try {
      isLoading = true;
      await Future.delayed(const Duration(milliseconds: 10));
      notifyListeners();

      await fn();
    } catch (e, stacktrace) {
      print('fetch data fail $e $stacktrace}');
      rethrow;
    } finally {
      isLoading = false;
      await Future.delayed(const Duration(milliseconds: 10));
      notifyListeners();
    }
  }

}