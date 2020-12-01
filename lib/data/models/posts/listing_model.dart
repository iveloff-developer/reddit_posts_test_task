import 'package:meta/meta.dart';
import 'package:netsells_test/data/models/posts/posts_model.dart';
import 'package:netsells_test/domain/entities/posts/listing.dart';

class ListingModel extends Listing {
  ListingModel({
    @required String kind,
    @required PostsModel data,
  }) : super(
          kind: kind,
          data: data,
        );
}
