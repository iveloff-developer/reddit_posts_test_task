import 'package:netsells_test/data/models/posts/posts_model.dart';

abstract class PostsRemoteDatasource {
  Future<PostsModel> getHotPosts();
}

class PostsRemoteDatasourceImpl implements PostsRemoteDatasource {
  @override
  Future<PostsModel> getHotPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
