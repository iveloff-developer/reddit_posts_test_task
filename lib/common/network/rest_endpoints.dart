import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';

enum RestEndpoints {
  FlutterDev,
  Apple,
}

extension RestEndpointsExt on RestEndpoints {
  static const String _baseUrl = 'https://www.reddit.com/r';

  String get endpoint => this.toString().split('.').last;
  String url(PostsSortCredential credential) {
    return '$_baseUrl/$endpoint/${credential.value}.json';
  }
}
