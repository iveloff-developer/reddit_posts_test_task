import 'package:netsells_test/domain/entities/posts/post_details.dart';
import 'package:meta/meta.dart';

class PostDetailsModel extends PostDetails {
  PostDetailsModel({
    @required String authorFullname,
    @required String title,
    @required String selftext,
  }) : super(
          authorFullname: authorFullname,
          title: title,
          selftext: selftext,
        );

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsModel(
      authorFullname: json[PostDetailsModelKeys.author_fullname.key],
      title: json[PostDetailsModelKeys.title.key],
      selftext: json[PostDetailsModelKeys.selftext.key],
    );
  }
}

enum PostDetailsModelKeys {
  author_fullname,
  title,
  selftext,
}

extension on PostDetailsModelKeys {
  String get key => this.toString().split('.').last;
}
