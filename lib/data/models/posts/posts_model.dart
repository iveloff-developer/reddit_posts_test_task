import 'package:meta/meta.dart';
import 'package:netsells_test/data/models/posts/post_details_model.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';

class PostsModel extends Posts {
  PostsModel({@required List<PostDetailsModel> children})
      : super(children: children);

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      children: List.from(json[PostsModelKeys.children.key])
          .map((postJsonMap) => PostDetailsModel.fromJson(postJsonMap))
          .toList(),
    );
  }
}

enum PostsModelKeys { children }

extension on PostsModelKeys {
  String get key => this.toString().split('.').last;
}
