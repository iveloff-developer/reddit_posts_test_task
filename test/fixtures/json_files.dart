import 'dart:io';

enum JsonFiles {
  post,
  posts,
}

extension JsonFiledExt on JsonFiles {
  String fixture() =>
      File('test/fixtures/jsons/$_name.json').readAsStringSync();

  String get _name => this.toString().split('.').last;
}
