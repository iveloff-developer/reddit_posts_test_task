import 'package:netsells_test/data/models/posts/posts_model.dart';
import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';

abstract class PostsRemoteDatasource {
  Future<PostsModel> getPosts(PostsTypeCredential type);
}

class PostsRemoteDatasourceImpl implements PostsRemoteDatasource {
  @override
  Future<PostsModel> getPosts(PostsTypeCredential type) {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
