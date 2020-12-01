import 'package:meta/meta.dart';
import 'package:netsells_test/data/models/posts/post_model.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';

class PostsModel extends Posts {
  PostsModel({
    @required String modhash,
    @required int dist,
    @required List<PostModel> children,
  }) : super(
          modhash: modhash,
          dist: dist,
          children: children,
        );

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      modhash: json[PostsModelKeys.modhash.key],
      dist: json[PostsModelKeys.dist.key],
      children: List.from(json[PostsModelKeys.children.key])
          .map((postJsonMap) => PostModel.fromJson(postJsonMap))
          .toList(),
    );
  }
}

enum PostsModelKeys {
  modhash,
  dist,
  children,
}

extension on PostsModelKeys {
  String get key => this.toString().split('.').last;
}
