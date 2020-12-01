import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:netsells_test/common/exceptions/server_exception.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/common/network/rest_headers.dart';
import 'package:netsells_test/data/datasources/posts/posts_remote_datasource.dart';
import 'package:netsells_test/data/models/posts/post_model.dart';
import 'package:netsells_test/data/models/posts/posts_model.dart';
import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';

import '../../../fixtures/json_files.dart';
import '../../../fixtures/test_data.dart';

class MockClient extends Mock implements Client {}

void main() {
  MockClient mockClient;
  PostsRemoteDatasource rds;

  setUp(
    () {
      mockClient = MockClient();
      rds = PostsRemoteDatasourceImpl(client: mockClient);
    },
  );

  final postsModel = TestData.postsModel;

  test(
    'should preform a GET request on a URL with posts type being the endpoint and with application/json header',
    () {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => Response(JsonFiles.listing.fixture(), 200),
      );

      rds.getPosts(PostsTypeCredential.Hot);

      verify(
        mockClient.get(
          RestEndpoints.FlutterDev.url(PostsTypeCredential.Hot),
          headers: {
            RestHeadersKeys.contentType: RestHeadersValues.applicationJson,
          },
        ),
      );
    },
  );

  test(
    'should return [Posts] when the response code is 200 (success)or other',
    () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => Response(JsonFiles.listing.fixture(), 200),
      );

      final result = await rds.getPosts(PostsTypeCredential.Hot);

      expect(result, equals(postsModel));
    },
  );

  test(
    'should throw [ServerException] when the response code is 404 or other',
    () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => Response('Something went wrong', 404),
      );

      expect(
        rds.getPosts(PostsTypeCredential.Hot),
        throwsA(isInstanceOf<ServerException>()),
      );
    },
  );
}
