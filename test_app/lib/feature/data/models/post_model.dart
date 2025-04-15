import 'package:test_app/feature/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required userId,
    required id,
    required title,
    required body,
  }) : super(
          userId: userId,
          id: id,
          title: title,
          body: body,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
