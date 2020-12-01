import 'package:flutter_test/flutter_test.dart';
import 'package:netsells_test/data/models/posts/post_model.dart';
import 'package:netsells_test/domain/entities/posts/post.dart';

void main() {
  final postModel = PostModel(
    authorFullname: 'name',
    title: 'title',
    selftext: 'text',
  );

  test(
    "should be a subclass of [Post]",
    () {
      expect(postModel, isA<Post>());
    },
  );
}
