import 'package:flutter/material.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/presentation/pages/home/widgets/home_drawer_button.dart';

typedef DrawerCallback = void Function(RestEndpoints endpoint);

class HomeDrawer extends StatefulWidget {
  final DrawerCallback callback;

  const HomeDrawer({
    Key key,
    @required this.callback,
  }) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  Widget _buildHomeDrawerButton(RestEndpoints endpoint) {
    return HomeDrawerButton(
      title: endpoint.endpoint,
      onPressed: () {
        widget.callback(endpoint);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.4,
      child: Drawer(
        child: ListView(
          children: RestEndpoints.values
              .map((endpoint) => _buildHomeDrawerButton(endpoint))
              .toList(),
        ),
      ),
    );
  }
}
