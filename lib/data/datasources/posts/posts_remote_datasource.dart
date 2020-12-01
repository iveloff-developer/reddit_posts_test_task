import 'dart:convert';

import 'package:http/http.dart';
import 'package:netsells_test/common/exceptions/server_exception.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/common/network/rest_headers.dart';
import 'package:netsells_test/data/models/posts/listing_model.dart';
import 'package:netsells_test/data/models/posts/posts_model.dart';
import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';
import 'package:meta/meta.dart';

abstract class PostsRemoteDatasource {
  Future<PostsModel> getPosts(PostsTypeCredential type);
}

class PostsRemoteDatasourceImpl implements PostsRemoteDatasource {
  final Client client;

  PostsRemoteDatasourceImpl({@required this.client});

  @override
  Future<PostsModel> getPosts(PostsTypeCredential type) async {
    final response = await client.get(
      RestEndpoints.FlutterDev.url(type),
      headers: {
        RestHeadersKeys.contentType: RestHeadersValues.applicationJson,
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final listingJsonMap = jsonDecode(response.body);
      return PostsModel.fromJson(listingJsonMap[ListingModelKeys.data.key]);
    } else {
      throw ServerException();
    }
  }
}
