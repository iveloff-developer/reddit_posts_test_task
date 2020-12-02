import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';
import 'package:netsells_test/domain/entities/posts/post.dart';
import 'package:netsells_test/presentation/cubits/cubit_helper.dart';
import 'package:netsells_test/presentation/cubits/posts/posts_cubit.dart';
import 'package:netsells_test/presentation/pages/home/widgets/post_item.dart';
import 'package:netsells_test/presentation/widgets/list_views/refreshable_list_view.dart';
import 'package:netsells_test/presentation/widgets/texts/pull_to_refresh_text.dart';

class HomeListView extends StatelessWidget {
  final RestEndpoints endpoint;
  final PostsSortCredential sortCredential;

  const HomeListView({
    Key key,
    @required this.endpoint,
    @required this.sortCredential,
  }) : super(key: key);

  List<PostItem> _getPostItemListFromPosts(List<Post> posts) {
    return posts.map((post) => PostItem(post: post)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return RefreshableListView(
          onRefresh: () async {
            cubit<PostsCubit>(context).getPosts(endpoint, sortCredential);
          },
          children: [
            if (state is PostsLoadedState)
              ...?_getPostItemListFromPosts(state.posts.children),
            if (state is PostsErrorState)
              PullToRefreshText(errorMessage: state.message),
          ],
        );
      },
    );
  }
}
