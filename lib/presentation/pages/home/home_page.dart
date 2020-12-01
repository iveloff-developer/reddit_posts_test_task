import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';
import 'package:netsells_test/presentation/cubits/cubit_helper.dart';
import 'package:netsells_test/presentation/cubits/posts/posts_cubit.dart';
import 'package:netsells_test/presentation/pages/home/widgets/home_drawer.dart';
import 'package:netsells_test/presentation/pages/home/widgets/post_item.dart';
import 'package:netsells_test/presentation/widgets/scaffolds/common_scaffold.dart';
import 'package:netsells_test/presentation/widgets/tab_bars/common_tab_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  RestEndpoints endpoint;
  PostsSortCredential credential;

  @override
  void initState() {
    super.initState();
    endpoint = RestEndpoints.FlutterDev;
    credential = PostsSortCredential.Hot;
    _getPosts();
  }

  void _getPosts() {
    cubit<PostsCubit>(context).getPosts(endpoint, credential);
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Posts'),
      bottom: CommonTabBar(
        onTabTap: (value) {
          setState(() {
            credential = PostsSortCredential.values[value];
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
        Navigator.pop(context);
      },
    );
  }

  Widget _buildBody(PostsState state) {
    return RefreshIndicator(
      onRefresh: () async {
        _getPosts();
      },
      child: ListView(
        children: (state is PostsLoadedState)
            ? state.posts.children.map((post) => PostItem(post: post)).toList()
            : [],
      ),
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
          body: _buildBody(state),
        );
      },
    );
  }
}
