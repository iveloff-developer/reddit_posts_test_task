import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';
import 'package:netsells_test/presentation/cubits/cubit_helper.dart';
import 'package:netsells_test/presentation/cubits/posts/posts_cubit.dart';
import 'package:netsells_test/presentation/pages/home/widgets/home_drawer.dart';
import 'package:netsells_test/presentation/pages/home/widgets/home_list_view.dart';
import 'package:netsells_test/presentation/pages/home/widgets/post_item.dart';
import 'package:netsells_test/presentation/widgets/scaffolds/common_scaffold.dart';
import 'package:netsells_test/presentation/widgets/tab_bars/common_tab_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  RestEndpoints endpoint;
  PostsSortCredential sortCredential;

  @override
  void initState() {
    super.initState();
    endpoint = RestEndpoints.FlutterDev;
    sortCredential = PostsSortCredential.Hot;
    _getPosts();
  }

  void _getPosts() {
    cubit<PostsCubit>(context).getPosts(endpoint, sortCredential);
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(endpoint.endpoint),
      bottom: CommonTabBar(
        onTabTap: (value) {
          setState(() {
            sortCredential = PostsSortCredential.values[value];
          });
          _getPosts();
        },
      ),
    );
  }

  Widget _buildDrawer() {
    return HomeDrawer(
      callback: (newEndpoint) {
        setState(() {
          endpoint = newEndpoint;
        });
        _getPosts();
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CommonScaffold(
          isLoading: state is PostsLoadingState,
          appBar: _buildAppBar(),
          drawer: _buildDrawer(),
          body: HomeListView(
            endpoint: endpoint,
            sortCredential: sortCredential,
          ),
        );
      },
    );
  }
}
