import 'package:netsells_test/domain/entities/posts/post.dart';
import 'package:meta/meta.dart';

class PostModel extends Post {
  PostModel({
    @required String authorFullname,
    @required String selftext,
  }) : super(
          authorFullname: authorFullname,
          selftext: selftext,
        );
}
