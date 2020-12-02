import 'package:flutter/material.dart';
import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';

typedef VoidTabBarCallback = void Function(int);

class CommonTabBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final VoidTabBarCallback onTabTap;

  const CommonTabBar({
    Key key,
    this.height = kToolbarHeight,
    @required this.onTabTap,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTabTap,
      tabs: [
        Tab(
          text: PostsSortCredential.Hot.value,
          icon: Icon(Icons.local_fire_department),
        ),
        Tab(
          text: PostsSortCredential.New.value,
          icon: Icon(Icons.fiber_new),
        ),
        Tab(
          text: PostsSortCredential.Top.value,
          icon: Icon(Icons.star_rate),
        ),
      ],
    );
  }
}
