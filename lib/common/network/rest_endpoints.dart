import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';

enum RestEndpoints {
  FlutterDev,
  Apple,
  Google,
  TeslaMotors,
  Facebook,
  Netflix,
  Boxing,
  Wow,
  Music,
  Tinder,
  StarWars,
  Sports,
  Movies,
  HarryPotter,
  Steam,
  Australia,
}

extension RestEndpointsExt on RestEndpoints {
  static const String _baseUrl = 'https://www.reddit.com/r';

  String get value => this.toString().split('.').last;
  String url(PostsSortCredential credential) {
    return '$_baseUrl/$value/${credential.value}.json';
  }
}
