import 'package:flutter/material.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/presentation/pages/home/widgets/home_drawer_button.dart';

typedef DrawerCallback = void Function(RestEndpoints endpoint);

class HomeDrawer extends StatefulWidget {
  final DrawerCallback onItemPressed;

  const HomeDrawer({
    Key key,
    @required this.onItemPressed,
  }) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.4,
      child: Drawer(
        child: ListView(
          children: RestEndpoints.values.map(
            (endpoint) {
              return HomeDrawerButton(
                title: endpoint.value,
                onPressed: () {
                  widget.onItemPressed(endpoint);
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
