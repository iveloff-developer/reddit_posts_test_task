enum PostsTypeCredential {
  Hot,
  New,
  Top,
}

extension PostsTypeCredentialExt on PostsTypeCredential {
  String get type => this.toString().split('.').last.toLowerCase();
}
