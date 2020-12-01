import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsells_test/app.dart';
import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';
import 'package:netsells_test/presentation/cubits/cubit_helper.dart';
import 'package:netsells_test/presentation/cubits/posts/posts_cubit.dart';
import 'package:netsells_test/presentation/pages/home/widgets/post_item.dart';
import 'package:netsells_test/presentation/widgets/scaffolds/common_scaffold.dart';
import 'package:netsells_test/presentation/widgets/tab_bars/common_tab_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  PostsTypeCredential credential;

  @override
  void initState() {
    super.initState();
    credential = PostsTypeCredential.Hot;
    _getPosts(credential);
  }

  void _getPosts(PostsTypeCredential credential) {
    cubit<PostsCubit>(context).getPosts(credential);
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Posts'),
      bottom: CommonTabBar(
        onTabTap: (value) {
          setState(() {
            credential = PostsTypeCredential.values[value];
          });
          _getPosts(credential);
        },
      ),
    );
  }

  Widget _buildBody(PostsState state) {
    return ListView(
      children: (state is PostsLoadedState)
          ? state.posts.children.map((post) => PostItem(post: post)).toList()
          : [],
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
          body: _buildBody(state),
        );
      },
    );
  }
}
