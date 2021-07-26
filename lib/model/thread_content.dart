import 'package:json_annotation/json_annotation.dart';
import 'package:lihkg_flutter/model/user.dart';

import 'category.dart';
import 'gender.dart';

part 'thread_content.g.dart';

@JsonSerializable()
class ThreadContentResponse {
  String threadId;
  String catId;
  String subCatId;
  String title;
  String userId;
  String userNickname;
  Gender userGender;
  String noOfReply;
  String noOfUniUserReply;
  int likeCount;
  int dislikeCount;
  String replyLikeCount;
  String replyDislikeCount;
  String maxReplyLikeCount;
  String maxReplyDislikeCount;
  int createTime;
  int lastReplyTime;
  String status;
  bool isAdu;
  // ResponseRemark remark;
  String lastReplyUserId;
  String maxReply;
  int totalPage;
  bool? isHot;
  Category category;
  bool displayVote;
  String voteStatus;
  bool isBookmarked;
  bool isReplied;
  User user;
  String page;
  List<ThreadContentResponseItemData> itemData;

  ThreadContentResponse({
    required this.threadId,
    required this.catId,
    required this.subCatId,
    required this.title,
    required this.userId,
    required this.userNickname,
    required this.userGender,
    required this.noOfReply,
    required this.noOfUniUserReply,
    required this.likeCount,
    required this.dislikeCount,
    required this.replyLikeCount,
    required this.replyDislikeCount,
    required this.maxReplyLikeCount,
    required this.maxReplyDislikeCount,
    required this.createTime,
    required this.lastReplyTime,
    required this.status,
    required this.isAdu,
    // required this.remark,
    required this.lastReplyUserId,
    required this.maxReply,
    required this.totalPage,
    this.isHot,
    required this.category,
    required this.displayVote,
    required this.voteStatus,
    required this.isBookmarked,
    required this.isReplied,
    required this.user,
    required this.page,
    required this.itemData,
  });

  factory ThreadContentResponse.fromJson(Map<String, dynamic> json) =>
      _$ThreadContentResponseFromJson(json);
}

@JsonSerializable()
class ThreadContentResponseItemData {
  String postId;
  String? quotePostId;
  String threadId;
  String userNickname;
  Gender userGender;
  String likeCount;
  String dislikeCount;
  String? voteScore;
  String? noOfQuote;
  dynamic remark;
  String? status;
  int? replyTime;
  String msgNum;
  String msg;
  bool? isMinimizedKeywords;
  int page;
  User user;
  bool? displayVote;
  bool? lowQuality;
  // Quote? quote;

  ThreadContentResponseItemData({
    required this.postId,
    this.quotePostId,
    required this.threadId,
    required this.userNickname,
    required this.userGender,
    required this.likeCount,
    required this.dislikeCount,
    this.voteScore,
    this.noOfQuote,
    this.remark,
    this.status,
    this.replyTime,
    required this.msgNum,
    required this.msg,
    this.isMinimizedKeywords,
    required this.page,
    required this.user,
    this.displayVote,
    this.lowQuality,
    // this.quote,
  });

  factory ThreadContentResponseItemData.fromJson(Map<String, dynamic> json) =>
      _$ThreadContentResponseItemDataFromJson(json);
}

// class Quote {
//   Quote({
//     this.postId,
//     this.quotePostId,
//     this.threadId,
//     this.userNickname,
//     this.userGender,
//     this.likeCount,
//     this.dislikeCount,
//     this.voteScore,
//     this.noOfQuote,
//     this.remark,
//     this.status,
//     this.replyTime,
//     this.msgNum,
//     this.msg,
//     this.isMinimizedKeywords,
//     this.page,
//     this.user,
//     this.displayVote,
//     this.lowQuality,
//     this.quote,
//   });
//
//   String postId;
//   QuotePostId quotePostId;
//   String threadId;
//   String userNickname;
//   Gender userGender;
//   String likeCount;
//   String dislikeCount;
//   String voteScore;
//   String noOfQuote;
//   List<dynamic> remark;
//   String status;
//   int replyTime;
//   String msgNum;
//   String msg;
//   bool isMinimizedKeywords;
//   int page;
//   User user;
//   bool displayVote;
//   bool lowQuality;
//   Quote quote;
//
//   factory Quote.fromJson(Map<String, dynamic> json) => Quote(
//     postId: json["post_id"],
//     quotePostId: quotePostIdValues.map[json["quote_post_id"]],
//     threadId: json["thread_id"],
//     userNickname: json["user_nickname"],
//     userGender: genderValues.map[json["user_gender"]],
//     likeCount: json["like_count"],
//     dislikeCount: json["dislike_count"],
//     voteScore: json["vote_score"],
//     noOfQuote: json["no_of_quote"],
//     remark: List<dynamic>.from(json["remark"].map((x) => x)),
//     status: json["status"],
//     replyTime: json["reply_time"],
//     msgNum: json["msg_num"],
//     msg: json["msg"],
//     isMinimizedKeywords: json["is_minimized_keywords"],
//     page: json["page"],
//     user: User.fromJson(json["user"]),
//     displayVote: json["display_vote"],
//     lowQuality: json["low_quality"],
//     quote: json["quote"] == null ? null : Quote.fromJson(json["quote"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "post_id": postId,
//     "quote_post_id": quotePostIdValues.reverse[quotePostId],
//     "thread_id": threadId,
//     "user_nickname": userNickname,
//     "user_gender": genderValues.reverse[userGender],
//     "like_count": likeCount,
//     "dislike_count": dislikeCount,
//     "vote_score": voteScore,
//     "no_of_quote": noOfQuote,
//     "remark": List<dynamic>.from(remark.map((x) => x)),
//     "status": status,
//     "reply_time": replyTime,
//     "msg_num": msgNum,
//     "msg": msg,
//     "is_minimized_keywords": isMinimizedKeywords,
//     "page": page,
//     "user": user.toJson(),
//     "display_vote": displayVote,
//     "low_quality": lowQuality,
//     "quote": quote == null ? null : quote.toJson(),
//   };
// }
