import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netsells_test/common/exceptions/server_exception.dart';
import 'package:netsells_test/common/network/network_controller.dart';
import 'package:netsells_test/data/datasources/posts/posts_remote_datasource.dart';
import 'package:netsells_test/data/models/posts/post_model.dart';
import 'package:netsells_test/data/models/posts/posts_model.dart';
import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';
import 'package:netsells_test/domain/repositories/posts/posts_repository.dart';

class MockNetworkController extends Mock implements NetworkController {}

class MockPostsRemoteDatasource extends Mock implements PostsRemoteDatasource {}

void main() {
  MockNetworkController mockNetworkController;
  MockPostsRemoteDatasource mockRDS;
  PostsRepository repository;

  final postModel = PostModel(
    authorFullname: 't2_6l4z3',
    title: 'App Feedback Thread - November 24, 2020',
    selftext:
        'This thread is for getting feedback on your own apps.\n\n####Developers:\n\n- must **provide feedback** for others\n- must include **Play Store**, **App Store**, **GitHub**, **GitLab**, or **BitBucket** link\n- must make top level comment\n- must make effort to respond to questions and feedback from commenters\n- may be open or closed source\n\n####Commenters:\n\n- must give **constructive feedback** in replies to top level comments\n- must not include links to other apps\n\nTo cut down on spam, accounts who are too young or do not have enough karma to post will be removed. Please make an effort to contribute to the community before asking for feedback.\n\nAs always, the mod team is only a small group of people, and we rely on the readers to help us maintain this subreddit. Please report any rule breakers. Thank you.\n\n\\- r/FlutterDev Mods',
  );
  final postsModel = PostsModel(
    modhash: '',
    dist: 2,
    children: [postModel, postModel],
  );
  final Posts posts = postsModel;

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
}
