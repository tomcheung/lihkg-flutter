import 'package:lihkg_flutter/model/post.dart';

abstract class ThreadContentItemData {
  abstract String msg;
  abstract String likeCount;
  abstract String dislikeCount;
  abstract int noOfQuote;
  abstract DateTime replyTime;
  abstract String userNickname;
  abstract PostQuote? quote;
}