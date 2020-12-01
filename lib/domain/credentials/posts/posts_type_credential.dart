enum PostsTypeCredential {
  Hot,
  New,
  Top,
}

extension PostsTypeCredentialExt on PostsTypeCredential {
  String get value => this.toString().split('.').last.toLowerCase();
}
