import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netsells_test/common/network/network_controller.dart';
import 'package:netsells_test/data/datasources/posts/posts_remote_datasource.dart';
import 'package:netsells_test/domain/repositories/posts/posts_repository.dart';

class MockNetworkController extends Mock implements NetworkController {}

class MockPostsRemoteDatasource extends Mock implements PostsRemoteDatasource {}

void main() {
  MockNetworkController mockNetworkController;
  MockPostsRemoteDatasource mockRDS;
  PostsRepository repository;

  setUp(
    () {
      mockNetworkController = MockNetworkController();
      mockRDS = MockPostsRemoteDatasource();
      repository = PostsRepositoryImpl(
        networkController: mockNetworkController,
        rds: mockRDS,
      );
    },
  );
}
