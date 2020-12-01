import 'package:meta/meta.dart';
import 'package:netsells_test/common/exceptions/no_internet_exception.dart';
import 'package:netsells_test/common/exceptions/server_exception.dart';
import 'package:netsells_test/common/network/network_controller.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/data/datasources/posts/posts_remote_datasource.dart';
import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';

abstract class PostsRepository {
  Future<Posts> getPosts(
    RestEndpoints endpoint,
    PostsSortCredential credential,
  );
}

class PostsRepositoryImpl implements PostsRepository {
  final NetworkController networkController;
  final PostsRemoteDatasource rds;

  PostsRepositoryImpl({
    @required this.networkController,
    @required this.rds,
  });

  @override
  Future<Posts> getPosts(
    RestEndpoints endpoint,
    PostsSortCredential credential,
  ) async {
    if (await networkController.hasConnection()) {
      try {
        return await rds.getPosts(endpoint, credential);
      } on ServerException {
        rethrow;
      }
    }
    throw NoInternetException();
  }
}
