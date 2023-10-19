import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lihkg_flutter/model/post.dart';
import 'package:lihkg_flutter/model/user.dart';
import 'package:lihkg_flutter/screen/thread_content/thread_content_data.dart';
import 'package:lihkg_flutter/util/serialiser/datetime_serialiser.dart';
import 'gender.dart';

part 'quote.g.dart';

@JsonSerializable()
class QuoteResponse{
  String page;
  List<Quote> itemData;

  QuoteResponse({
    required this.page,
    required this.itemData,
  });

  factory QuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteResponseFromJson(json);
}

@JsonSerializable()
class Quote implements ThreadContentItemData  {
  @override
  String postId;
  String quotePostId;
  @override
  String threadId;
  @override
  String userNickname;
  Gender userGender;
  @override
  int likeCount;
  @override
  int dislikeCount;
  int voteScore;
  @override
  int noOfQuote;

  int status;
  @override
  @DateTimeStringSerialiser()
  DateTime replyTime;
  int msgNum;
  @override
  String msg;
  bool isMinimizedKeywords;
  int page;
  User user;
  bool displayVote;
  bool lowQuality;

  Quote({
    required this.postId,
    required this.quotePostId,
    required this.threadId,
    required this.userNickname,
    required this.userGender,
    required this.likeCount,
    required this.dislikeCount,
    required this.voteScore,
    required this.noOfQuote,
    //required this.remark,
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

  @override
  PostQuote? quote;
}
