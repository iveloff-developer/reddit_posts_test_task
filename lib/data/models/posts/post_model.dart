import 'package:netsells_test/data/models/posts/post_details_model.dart';
import 'package:netsells_test/domain/entities/posts/post.dart';
import 'package:meta/meta.dart';

class PostModel extends Post {
  PostModel({@required PostDetailsModel data}) : super(data: data);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      data: PostDetailsModel.fromJson(json[PostModelKeys.data.key]),
    );
  }
}

enum PostModelKeys { data }

extension on PostModelKeys {
  String get key => this.toString().split('.').last;
}
