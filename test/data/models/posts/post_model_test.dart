import 'package:flutter_test/flutter_test.dart';
import 'package:netsells_test/data/models/posts/post_details_model.dart';
import 'package:netsells_test/domain/entities/posts/post_details.dart';

import '../../../fixtures/test_data.dart';

void main() {
  final postJsonMap = TestData.postDetailsJsonMap;
  final postModel = TestData.postDetailsModel;

  test(
    "should be a subclass of [PostDetails]",
    () {
      expect(postModel, isA<PostDetails>());
    },
  );

  group(
    "fromJson",
    () {
      test(
        "should return a valid [PostDetailsModel] from JSON",
        () {
          final result = PostDetailsModel.fromJson(postJsonMap);

          expect(result, postModel);
        },
      );
    },
  );
}
