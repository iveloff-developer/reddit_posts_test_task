import 'package:flutter_test/flutter_test.dart';
import 'package:netsells_test/data/models/posts/posts_model.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';

import '../../../fixtures/test_data.dart';

void main() {
  final postsJsonMap = TestData.postsJsonMap;
  final postsModel = TestData.postsModel;

  test(
    "should be a subclass of [Posts]",
    () {
      expect(postsModel, isA<Posts>());
    },
  );

  group(
    "fromJson",
    () {
      test(
        "should return a valid [PostsModel] from JSON",
        () {
          final result = PostsModel.fromJson(postsJsonMap);

          expect(result, postsModel);
        },
      );
    },
  );
}
