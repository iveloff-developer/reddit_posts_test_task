import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netsells_test/common/exceptions/no_internet_exception.dart';
import 'package:netsells_test/common/exceptions/server_exception.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';
import 'package:netsells_test/domain/repositories/posts/posts_repository.dart';
import 'package:netsells_test/presentation/cubits/posts/posts_cubit.dart';

import '../../../fixtures/test_data.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

void main() {
  MockPostsRepository mockRepository;

  setUp(
    () {
      mockRepository = MockPostsRepository();
    },
  );

  group(
    'getPosts',
    () {
      final Posts posts = TestData.postsModel;
      final serverException = ServerException();
      final noInternetException = NoInternetException();

      blocTest(
        'emits [PostsLoadingState, PostsLoadedState] when successful',
        build: () {
          when(
            mockRepository.getPosts(
                RestEndpoints.FlutterDev, PostsSortCredential.Hot),
          ).thenAnswer(
            (_) async => posts,
          );
          return PostsCubit(repository: mockRepository);
        },
        act: (PostsCubit cubit) async => await cubit.getPosts(
          RestEndpoints.FlutterDev,
          PostsSortCredential.Hot,
        ),
        expect: [
          PostsLoadingState(),
          PostsLoadedState(posts: posts),
        ],
      );

      blocTest(
        'emits [PostsLoadingState, PostsErrorState] when [ServerException]',
        build: () {
          when(
            mockRepository.getPosts(
              RestEndpoints.FlutterDev,
              PostsSortCredential.Hot,
            ),
          ).thenThrow(
            serverException,
          );
          return PostsCubit(repository: mockRepository);
        },
        act: (PostsCubit cubit) async => await cubit.getPosts(
          RestEndpoints.FlutterDev,
          PostsSortCredential.Hot,
        ),
        expect: [
          PostsLoadingState(),
          PostsErrorState(message: serverException.message),
        ],
      );
      blocTest(
        'emits [PostsLoadingState, PostsErrorState] when [NoInternetException]',
        build: () {
          when(
            mockRepository.getPosts(
              RestEndpoints.FlutterDev,
              PostsSortCredential.Hot,
            ),
          ).thenThrow(
            noInternetException,
          );
          return PostsCubit(repository: mockRepository);
        },
        act: (PostsCubit cubit) async => await cubit.getPosts(
          RestEndpoints.FlutterDev,
          PostsSortCredential.Hot,
        ),
        expect: [
          PostsLoadingState(),
          PostsErrorState(message: noInternetException.message),
        ],
      );
    },
  );
}
