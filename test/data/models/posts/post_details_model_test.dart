import 'package:flutter_test/flutter_test.dart';
import 'package:netsells_test/data/models/posts/post_details_model.dart';
import 'package:netsells_test/domain/entities/posts/post_details.dart';

import '../../../fixtures/test_data.dart';

void main() {
  final postDetailsJsonMap = TestData.postDetailsJsonMap;
  final postDetailsModel = TestData.postDetailsModel;

  test(
    "should be a subclass of [PostDetails]",
    () {
      expect(postDetailsModel, isA<PostDetails>());
    },
  );

  group(
    "fromJson",
    () {
      test(
        "should return a valid [PostDetailsModel] from JSON",
        () {
          final result = PostDetailsModel.fromJson(postDetailsJsonMap);

          expect(result, postDetailsModel);
        },
      );
    },
  );
}
