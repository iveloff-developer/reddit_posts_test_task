import 'package:flutter/material.dart';
import 'package:netsells_test/presentation/widgets/tab_bars/common_tab_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidTabBarCallback onTabTap;

  double get tabBarHeight => kToolbarHeight;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + tabBarHeight);

  const HomeAppBar({
    Key key,
    @required this.title,
    @required this.onTabTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      bottom: CommonTabBar(
        height: tabBarHeight,
        onTabTap: onTabTap,
      ),
    );
  }
}
