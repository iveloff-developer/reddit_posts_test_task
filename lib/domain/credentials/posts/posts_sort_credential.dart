enum PostsSortCredential {
  Hot,
  New,
  Top,
}

extension PostsSortCredentialExt on PostsSortCredential {
  String get value => this.toString().split('.').last.toLowerCase();
}
