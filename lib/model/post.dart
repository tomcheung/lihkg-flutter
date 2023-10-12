import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lihkg_flutter/model/user.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';
import 'package:lihkg_flutter/util/serialiser/datetime_serialiser.dart';
import 'package:lihkg_flutter/util/serialiser/dynamic_string_serialiser.dart';

import 'gender.dart';

part 'post.g.dart';

@JsonSerializable()
class Post implements ThreadContentItemData {
  @override
  String postId;
  String? quotePostId;
  @override
  String threadId;
  @override
  String userNickname;
  Gender userGender;
  @override
  int likeCount;
  @override
  int dislikeCount;
  int? voteScore;
  @override
  int noOfQuote;
  // dynamic remark;
  int? status;
  @override
  @DateTimeStringSerialiser()
  DateTime replyTime;
  int msgNum;
  @override
  String msg;
  bool? isMinimizedKeywords;
  int page;
  User user;
  bool? displayVote;
  bool? lowQuality;
  @override
  PostQuote? quote;

  Post({
    required this.postId,
    this.quotePostId,
    required this.threadId,
    required this.userNickname,
    required this.userGender,
    required this.likeCount,
    required this.dislikeCount,
    this.voteScore,
    required this.noOfQuote,
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

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
}

@JsonSerializable()
class PostQuote {
  String postId;
  // QuotePostId quotePostId;
  String threadId;
  String userNickname;
  Gender userGender;
  int likeCount;
  int dislikeCount;
  int voteScore;
  int noOfQuote;
  // ThreadContentRemark? remark;
  @DynamicStringSerialiser()
  int? status;
  int replyTime;
  int msgNum;
  String msg;
  bool isMinimizedKeywords;
  int page;
  User user;
  bool displayVote;
  bool lowQuality;

  PostQuote({
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

  factory PostQuote.fromJson(Map<String, dynamic> json) =>
      _$PostQuoteFromJson(json);
}
