import 'package:meta/meta.dart';
import 'package:netsells_test/common/network/network_controller.dart';
import 'package:netsells_test/data/datasources/posts/posts_remote_datasource.dart';
import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';

abstract class PostsRepository {
  Future<Posts> getPosts(PostsTypeCredential type);
}

class PostsRepositoryImpl implements PostsRepository {
  final NetworkController networkController;
  final PostsRemoteDatasource rds;

  PostsRepositoryImpl({
    @required this.networkController,
    @required this.rds,
  });

  @override
  Future<Posts> getPosts(PostsTypeCredential type) async {
    if (await networkController.hasConnection()) {
      return await rds.getPosts(PostsTypeCredential.Hot);
    }
    return null;
  }
}
