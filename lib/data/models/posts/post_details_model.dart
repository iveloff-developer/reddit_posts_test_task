import 'package:netsells_test/domain/entities/posts/post_details.dart';
import 'package:meta/meta.dart';

class PostDetailsModel extends PostDetails {
  PostDetailsModel({
    @required String authorFullname,
    @required String title,
    @required String selftext,
    @required String url,
  }) : super(
          authorFullname: authorFullname,
          title: title,
          selftext: selftext,
          url: url,
        );

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsModel(
      authorFullname: json[PostDetailsModelKeys.author_fullname.key],
      title: json[PostDetailsModelKeys.title.key],
      selftext: json[PostDetailsModelKeys.selftext.key],
      url: json[PostDetailsModelKeys.url.key],
    );
  }
}

enum PostDetailsModelKeys {
  author_fullname,
  title,
  selftext,
  url,
}

extension on PostDetailsModelKeys {
  String get key => this.toString().split('.').last;
}
