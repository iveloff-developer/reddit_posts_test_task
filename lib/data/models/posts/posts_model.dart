import 'package:netsells_test/domain/entities/posts/post.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';
import 'package:meta/meta.dart';

class PostsModel extends Posts {
  PostsModel({
    @required String modhash,
    @required int dist,
    @required List<Post> children,
  }) : super(
          modhash: modhash,
          dist: dist,
          children: children,
        );
}
