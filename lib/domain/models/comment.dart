// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'user.dart';

class Comment {
  Comment({
    required this.text,
    required this.likes,
    required this.createdDate,
    required this.user,
    required this.replies,
  });

  final String text;
  final int likes;
  final DateTime createdDate;
  final User user;
  final List<Comment> replies;

  Comment copyWith({
    String? text,
    int? likes,
    DateTime? createdDate,
    User? user,
    List<Comment>? replies,
  }) {
    return Comment(
      text: text ?? this.text,
      likes: likes ?? this.likes,
      createdDate: createdDate ?? this.createdDate,
      user: user ?? this.user,
      replies: replies ?? this.replies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'likes': likes,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'user': user.toMap(),
      'replies': replies.map((x) => x.toMap()).toList(),
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      text: map['text'] as String,
      likes: map['likes'] as int,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int),
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      replies: List<Comment>.from(
        (map['replies'] as List<int>).map<Comment>(
          (x) => Comment.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Comment(text: $text, likes: $likes, createdDate: $createdDate, user: $user, replies: $replies)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.likes == likes &&
        other.createdDate == createdDate &&
        other.user == user &&
        listEquals(other.replies, replies);
  }

  @override
  int get hashCode {
    return text.hashCode ^
        likes.hashCode ^
        createdDate.hashCode ^
        user.hashCode ^
        replies.hashCode;
  }
}
