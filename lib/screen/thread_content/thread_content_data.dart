import 'package:lihkg_flutter/model/post.dart';

abstract class ThreadContentItemData {
  abstract String postId;
  abstract String threadId;
  abstract String msg;
  abstract int likeCount;
  abstract int dislikeCount;
  abstract int noOfQuote;
  abstract DateTime replyTime;
  abstract String userNickname;
  abstract PostQuote? quote;
}