import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:netsells_test/data/models/posts/post_model.dart';
import 'package:netsells_test/data/models/posts/posts_model.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';

import '../../../fixtures/json_files.dart';

void main() {
  final postsJsonMap = jsonDecode(JsonFiles.posts.fixture());
  final postModel = PostModel(
    authorFullname: 't2_6l4z3',
    title: 'App Feedback Thread - November 24, 2020',
    selftext:
        'This thread is for getting feedback on your own apps.\n\n####Developers:\n\n- must **provide feedback** for others\n- must include **Play Store**, **App Store**, **GitHub**, **GitLab**, or **BitBucket** link\n- must make top level comment\n- must make effort to respond to questions and feedback from commenters\n- may be open or closed source\n\n####Commenters:\n\n- must give **constructive feedback** in replies to top level comments\n- must not include links to other apps\n\nTo cut down on spam, accounts who are too young or do not have enough karma to post will be removed. Please make an effort to contribute to the community before asking for feedback.\n\nAs always, the mod team is only a small group of people, and we rely on the readers to help us maintain this subreddit. Please report any rule breakers. Thank you.\n\n\\- r/FlutterDev Mods',
  );
  final postsModel = PostsModel(
    modhash: '',
    dist: 2,
    children: [postModel, postModel],
  );

  test(
    "should be a subclass of [Posts]",
    () {
      expect(postsModel, isA<Posts>());
    },
  );

  group(
    "fromJson",
    () {
      test(
        "should return a valid [PostsModel] from JSON",
        () {
          final result = PostsModel.fromJson(postsJsonMap);

          expect(result, postsModel);
        },
      );
    },
  );
}
