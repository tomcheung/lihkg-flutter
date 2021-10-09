
import 'package:json_annotation/json_annotation.dart';
import 'package:lihkg_flutter/model/user.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';
import 'package:lihkg_flutter/util/serialiser/datetime_serialiser.dart';
import 'package:lihkg_flutter/util/serialiser/dynamic_string_serialiser.dart';
import 'package:lihkg_flutter/util/serialiser/string_to_int_serialiser.dart';

import 'gender.dart';

part 'post.g.dart';

@JsonSerializable()
class Post implements ThreadContentItemData {
  String postId;
  String? quotePostId;
  String threadId;
  @override
  String userNickname;
  Gender userGender;
  @override
  String likeCount;
  @override
  String dislikeCount;
  String? voteScore;
  @override
  @StringToIntSerialiser()
  int noOfQuote;
  // dynamic remark;
  @DynamicStringSerialiser()
  String? status;
  @override
  @DateTimeStringSerialiser()
  DateTime replyTime;
  String msgNum;
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
