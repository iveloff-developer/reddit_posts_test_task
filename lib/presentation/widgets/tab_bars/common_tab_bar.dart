import 'package:flutter/material.dart';
import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';

typedef VoidTabBarCallback = void Function(int);

class CommonTabBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidTabBarCallback onTabTap;

  const CommonTabBar({
    Key key,
    @required this.onTabTap,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTabTap,
      tabs: [
        Tab(
          text: PostsTypeCredential.Hot.value,
          icon: Icon(Icons.local_fire_department),
        ),
        Tab(
          text: PostsTypeCredential.New.value,
          icon: Icon(Icons.fiber_new),
        ),
        Tab(
          text: PostsTypeCredential.Top.value,
          icon: Icon(Icons.star_rate),
        ),
      ],
    );
  }
}
