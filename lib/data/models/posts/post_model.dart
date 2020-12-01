import 'package:netsells_test/domain/entities/posts/post.dart';
import 'package:meta/meta.dart';

class PostModel extends Post {
  PostModel({
    @required String authorFullname,
    @required String title,
    @required String selftext,
  }) : super(
          authorFullname: authorFullname,
          title: title,
          selftext: selftext,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      authorFullname: json[PostModelKeys.author_fullname.key],
      title: json[PostModelKeys.title.key],
      selftext: json[PostModelKeys.selftext.key],
    );
  }
}

enum PostModelKeys {
  author_fullname,
  title,
  selftext,
}

extension on PostModelKeys {
  String get key => this.toString().split('.').last;
}
