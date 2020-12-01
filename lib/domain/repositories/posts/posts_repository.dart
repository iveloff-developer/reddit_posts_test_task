import 'package:netsells_test/common/network/network_controller.dart';
import 'package:netsells_test/data/datasources/posts/posts_remote_datasource.dart';
import 'package:netsells_test/domain/entities/posts/post.dart';
import 'package:meta/meta.dart';

abstract class PostsRepository {
  Future<List<Post>> getHotPosts();
}

class PostsRepositoryImpl implements PostsRepository {
  final NetworkController networkController;
  final PostsRemoteDatasource rds;

  PostsRepositoryImpl({
    @required this.networkController,
    @required this.rds,
  });

  @override
  Future<List<Post>> getHotPosts() async {
    networkController.hasConnection();
    return null;
  }
}
