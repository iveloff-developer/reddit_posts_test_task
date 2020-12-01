import 'package:netsells_test/data/models/posts/post_model.dart';

abstract class PostsRemoteDatasource {
  Future<List<PostModel>> getHotPosts();
}

class PostsRemoteDatasourceImpl implements PostsRemoteDatasource {
  @override
  Future<List<PostModel>> getHotPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
