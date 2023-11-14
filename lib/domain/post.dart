import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required int id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'body') String? body,
    // 7. assign it with the `_Review` class constructor
  }) = _Post;

  // 8. define another factory constructor to parse from json
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}