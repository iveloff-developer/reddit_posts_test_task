import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';

enum RestEndpoints {
  FlutterDev,
}

extension RestEndpointsExt on RestEndpoints {
  static const String _baseUrl = 'https://www.reddit.com/r';

  String get _endpoint => this.toString().split('.').last;
  String url(PostsTypeCredential credential) {
    return '$_baseUrl/$_endpoint/${credential.value}.json';
  }
}
