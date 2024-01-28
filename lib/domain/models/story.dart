// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'comment.dart';
import 'user.dart';

class Story {
  Story({
    required this.id,
    required this.title,
    required this.text,
    required this.createdDate,
    required this.likes,
    required this.user,
    this.hasImages = false,
    this.isTrending = false,
    required this.comments,
  });

  final int id;
  final String title;
  final String text;
  final DateTime createdDate;
  final int likes;
  final User user;
  final bool hasImages;
  final bool isTrending;
  final List<Comment> comments;

  Story copyWith({
    int? id,
    String? title,
    String? text,
    DateTime? createdDate,
    int? likes,
    User? user,
    bool? hasImages,
    bool? isTrending,
    List<Comment>? comments,
  }) {
    return Story(
      id: id ?? this.id,
      title: title ?? this.title,
      text: text ?? this.text,
      createdDate: createdDate ?? this.createdDate,
      likes: likes ?? this.likes,
      user: user ?? this.user,
      hasImages: hasImages ?? this.hasImages,
      isTrending: isTrending ?? this.isTrending,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'text': text,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'likes': likes,
      'user': user.toMap(),
      'hasImages': hasImages,
      'isTrending': isTrending,
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'] as int,
      title: map['title'] as String,
      text: map['text'] as String,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int),
      likes: map['likes'] as int,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      hasImages: map['hasImages'] as bool,
      isTrending: map['isTrending'] as bool,
      comments: List<Comment>.from(
        (map['comments'] as List<int>).map<Comment>(
          (x) => Comment.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory Story.fromSnapshot(
    QueryDocumentSnapshot querySnapshot,
  ) {
    Map<String, dynamic> data = querySnapshot.data()! as Map<String, dynamic>;

    return Story(
      id: data["id"],
      title: data["title"],
      text: data["text"] ?? "",
      likes: data["likes"],
      createdDate: data["createdDate"].toDate(),
      user: data["user"].cast<String>(),
      comments: data["comment"].cast<String>(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) =>
      Story.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Story(id: $id, title: $title, text: $text, createdDate: $createdDate, likes: $likes, user: $user, hasImages: $hasImages, isTrending: $isTrending, comments: $comments)';
  }

  @override
  bool operator ==(covariant Story other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.text == text &&
        other.createdDate == createdDate &&
        other.likes == likes &&
        other.user == user &&
        other.hasImages == hasImages &&
        other.isTrending == isTrending &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        text.hashCode ^
        createdDate.hashCode ^
        likes.hashCode ^
        user.hashCode ^
        hasImages.hashCode ^
        isTrending.hashCode ^
        comments.hashCode;
  }
}

List<Story> trendingStories = [
  Story(
    id: 1,
    title: 'Non eu sit amet euismod',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. est vitae a dictum Ut aliqu amet, interdum lectus vitae ut...',
    createdDate: DateTime.now(),
    likes: 5,
    isTrending: true,
    user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
    comments: <Comment>[
      Comment(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipisc elit. Ut lorem fusce maecenas nulla sit mattis adipiscing netus. Lectus Hendrerit ut',
        likes: 3,
        createdDate: DateTime.now(),
        user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
        replies: List.empty(),
      ),
      Comment(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipisc elit. Ut lorem fusce maecenas nulla sit mattis adipiscing netus. Lectus Hendrerit ut',
        likes: 3,
        createdDate: DateTime.now(),
        user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
        replies: List.empty(),
      ),
    ],
  ),
  Story(
    id: 2,
    title: 'Non eu sit amet euismod',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. est vitae a dictum Ut aliqu amet, interdum lectus vitae ut...',
    createdDate: DateTime.now(),
    likes: 5,
    hasImages: true,
    user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
    comments: <Comment>[
      Comment(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipisc elit. Ut lorem fusce maecenas nulla sit mattis adipiscing netus. Lectus Hendrerit ut',
        likes: 3,
        createdDate: DateTime.now(),
        user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
        replies: List.empty(),
      ),
      Comment(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipisc elit. Ut lorem fusce maecenas nulla sit mattis adipiscing netus. Lectus Hendrerit ut',
          likes: 3,
          createdDate: DateTime.now(),
          user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
          replies: List.empty()),
    ],
  ),
  Story(
    id: 3,
    title: 'Non eu sit amet euismod',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. est vitae a dictum Ut aliqu amet, interdum lectus vitae ut...',
    createdDate: DateTime.now(),
    likes: 5,
    isTrending: true,
    user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
    comments: <Comment>[
      Comment(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipisc elit. Ut lorem fusce maecenas nulla sit mattis adipiscing netus. Lectus Hendrerit ut',
          likes: 3,
          createdDate: DateTime.now(),
          user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
          replies: List.empty()),
      Comment(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipisc elit. Ut lorem fusce maecenas nulla sit mattis adipiscing netus. Lectus Hendrerit ut',
          likes: 3,
          createdDate: DateTime.now(),
          user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
          replies: List.empty()),
    ],
  ),
  Story(
    id: 4,
    title: 'Non eu sit amet euismod',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. est vitae a dictum Ut  aliqu amet, interdum lectus vitae ut. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
        'est vitae a dictum Ut  aliqu amet, interdum lectus vitae ut. Lorem ipsum dolor sit amet, consectetur adipiscing elit. est vitae a dictum Ut  aliqu amet, interdum lectus vitae ut.'
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. est vitae a dictum Ut  aliqu amet, interdum lectus vitae ut.',
    createdDate: DateTime.now(),
    likes: 5,
    user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
    comments: <Comment>[
      Comment(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipisc elit. Ut lorem fusce maecenas nulla sit mattis adipiscing netus. Lectus Hendrerit ut',
          likes: 3,
          createdDate: DateTime.now(),
          user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
          replies: List.empty()),
      Comment(
          text:
              'Lorem ipsum dolor sit amet, consectetur adipisc elit. Ut lorem fusce maecenas nulla sit mattis adipiscing netus. Lectus Hendrerit ut',
          likes: 3,
          createdDate: DateTime.now(),
          user: User(id: '1', name: 'Sussexmama', iconUrl: 'author.png'),
          replies: List.empty()),
    ],
  ),
];
