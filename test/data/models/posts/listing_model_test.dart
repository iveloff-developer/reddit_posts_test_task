import 'package:flutter_test/flutter_test.dart';
import 'package:netsells_test/data/models/posts/listing_model.dart';
import 'package:netsells_test/domain/entities/posts/listing.dart';

import '../../../fixtures/test_data.dart';

void main() {
  final listingJsonMap = TestData.listingJsonMap;
  final listingModel = TestData.listingModel;

  test(
    "should be a subclass of [Listing]",
    () {
      expect(listingModel, isA<Listing>());
    },
  );

  group(
    "fromJson",
    () {
      test(
        "should return a valid [ListingModel] from JSON",
        () {
          final result = ListingModel.fromJson(listingJsonMap);

          expect(result, listingModel);
        },
      );
    },
  );
}
