
import 'package:json_annotation/json_annotation.dart';
import 'package:lihkg_flutter/model/user.dart';
import 'package:lihkg_flutter/util/serialiser/datetime_serialiser.dart';
import 'package:lihkg_flutter/util/serialiser/dynamic_string_serialiser.dart';

import 'gender.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
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

  Post({
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

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
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
  String? status;
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
