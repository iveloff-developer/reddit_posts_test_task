import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:netsells_test/data/datasources/posts/posts_remote_datasource.dart';

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
}
