import 'package:json_annotation/json_annotation.dart';
import 'package:lihkg_flutter/model/user.dart';
import 'package:lihkg_flutter/util/serialiser.dart';

import 'category.dart';
import 'gender.dart';

part 'thread_content.g.dart';

// @JsonSerializable()
// class ThreadContentRemark {
//   bool? isNotPushPost;
//
//   ThreadContentRemark({this.isNotPushPost});
//
//   factory ThreadContentRemark.fromJson(Map<String, dynamic> json) => _$ThreadContentRemarkFromJson(json);
// }

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
  @DateTimeStringSerialiser()
  DateTime lastReplyTime;
  @DynamicStringSerialiser()
  String? status;
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
    this.status,
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
  // dynamic remark;
  @DynamicStringSerialiser()
  String? status;
  @DateTimeStringSerialiser()
  DateTime replyTime;
  String msgNum;
  String msg;
  bool? isMinimizedKeywords;
  int page;
  User user;
  bool? displayVote;
  bool? lowQuality;
  Quote? quote;

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
    // this.remark,
    this.status,
    required this.replyTime,
    required this.msgNum,
    required this.msg,
    this.isMinimizedKeywords,
    required this.page,
    required this.user,
    this.displayVote,
    this.lowQuality,
    this.quote,
  });

  factory ThreadContentResponseItemData.fromJson(Map<String, dynamic> json) =>
      _$ThreadContentResponseItemDataFromJson(json);
}

@JsonSerializable()
class Quote {
  String postId;
  // QuotePostId quotePostId;
  String threadId;
  String userNickname;
  Gender userGender;
  String likeCount;
  String dislikeCount;
  String voteScore;
  String noOfQuote;
  // ThreadContentRemark? remark;
  @DynamicStringSerialiser()
  String status;
  int replyTime;
  String msgNum;
  String msg;
  bool isMinimizedKeywords;
  int page;
  User user;
  bool displayVote;
  bool lowQuality;

  Quote({
    required this.postId,
    // this.quotePostId,
    required this.threadId,
    required this.userNickname,
    required this.userGender,
    required this.likeCount,
    required this.dislikeCount,
    required this.voteScore,
    required this.noOfQuote,
    // this.remark,
    required this.status,
    required this.replyTime,
    required this.msgNum,
    required this.msg,
    required this.isMinimizedKeywords,
    required this.page,
    required this.user,
    required this.displayVote,
    required this.lowQuality,
  });

  factory Quote.fromJson(Map<String, dynamic> json) =>
      _$QuoteFromJson(json);
}
