import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netsells_test/common/exceptions/no_internet_exception.dart';
import 'package:netsells_test/common/exceptions/server_exception.dart';
import 'package:netsells_test/common/network/network_controller.dart';
import 'package:netsells_test/data/datasources/posts/posts_remote_datasource.dart';
import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';
import 'package:netsells_test/domain/repositories/posts/posts_repository.dart';

import '../../../fixtures/test_data.dart';

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

  final postsModel = TestData.postsModel;
  final Posts posts = postsModel;

  void getPostsFromRDS() {
    mockRDS.getPosts(PostsTypeCredential.Hot);
  }

  void whenHasConnection(bool hasConnection) {
    when(mockNetworkController.hasConnection()).thenAnswer(
      (_) async => hasConnection,
    );
  }

  test(
    'should check if the device is online',
    () async {
      whenHasConnection(true);

      await repository.getPosts(PostsTypeCredential.Hot);

      verify(mockNetworkController.hasConnection());
    },
  );
  group(
    "device is online",
    () {
      setUp(
        () {
          whenHasConnection(true);
        },
      );

      test(
        'should return [Posts] when the call to RDS is successful',
        () async {
          when(getPostsFromRDS()).thenAnswer((_) async => postsModel);
          final result = await repository.getPosts(PostsTypeCredential.Hot);

          verify(getPostsFromRDS());
          expect(result, posts);
        },
      );

      test(
        'should rethrow [ServerException] when the call to RDS is unsuccessful',
        () async {
          when(getPostsFromRDS()).thenThrow(ServerException());

          expect(
            repository.getPosts(PostsTypeCredential.Hot),
            throwsA(isInstanceOf<ServerException>()),
          );
        },
      );
    },
  );

  group(
    "device is offline",
    () {
      setUp(
        () {
          whenHasConnection(false);
        },
      );
      test(
        'should throw [NoInternetException]',
        () async {
          expect(
            repository.getPosts(PostsTypeCredential.Hot),
            throwsA(isInstanceOf<NoInternetException>()),
          );
        },
      );
    },
  );
}
