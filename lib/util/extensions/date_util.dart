extension DateExtension on DateTime {
  String dateAgoString() {
    final now = DateTime.now();
    final dateDiff = now.difference(this);
    if (dateDiff.inDays < 1) {
      if (dateDiff.inHours < 1) {
        return "${dateDiff.inMinutes} 分鐘前";
      } else {
        return "${dateDiff.inHours} 小時前";
      }
    } else if (dateDiff.inDays < 365) {
      return "${dateDiff.inDays} 日前";
    } else {
      return toString();
    }

  }
}