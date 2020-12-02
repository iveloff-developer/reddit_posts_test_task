import 'package:flutter/material.dart';
import 'package:netsells_test/domain/entities/posts/post.dart';
import 'package:url_launcher/url_launcher.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[50],
      margin: const EdgeInsets.all(16),
      child: ExpansionTile(
        leading: IconButton(
          icon: Icon(Icons.launch),
          onPressed: () async {
            final url = post.data.url;
            if (await canLaunch(url)) {
              launch(url);
            }
          },
        ),
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
