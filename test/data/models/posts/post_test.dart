import 'package:flutter_test/flutter_test.dart';
import 'package:netsells_test/data/models/posts/post_model.dart';
import 'package:netsells_test/domain/entities/posts/post.dart';

import '../../../fixtures/test_data.dart';

void main() {
  final postJsonMap = TestData.postJsonMap;
  final postModel = TestData.postModel;

  test(
    "should be a subclass of [Post]",
    () {
      expect(postModel, isA<Post>());
    },
  );

  group(
    "fromJson",
    () {
      test(
        "should return a valid [PostModel] from JSON",
        () {
          final result = PostModel.fromJson(postJsonMap);

          expect(result, postModel);
        },
      );
    },
  );
}
