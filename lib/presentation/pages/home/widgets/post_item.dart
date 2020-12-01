import 'package:flutter/material.dart';
import 'package:netsells_test/domain/entities/posts/post.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({
    Key key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[50],
      margin: const EdgeInsets.all(16),
      child: ExpansionTile(
        title: Text(
          post.data.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          "Author: ${post.data.authorFullname}",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(post.data.selftext),
          ),
        ],
      ),
    );
  }
}
