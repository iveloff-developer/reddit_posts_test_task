import 'package:netsells_test/data/models/posts/post_model.dart';

abstract class PostsRemoteDatasource {
  Future<List<PostModel>> getPosts();
}

class PostsRemoteDatasourceImpl implements PostsRemoteDatasource {
  @override
  Future<List<PostModel>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
