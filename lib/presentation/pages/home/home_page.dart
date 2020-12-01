import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsells_test/domain/credentials/posts/posts_type_credential.dart';
import 'package:netsells_test/presentation/cubits/cubit_helper.dart';
import 'package:netsells_test/presentation/cubits/posts/posts_cubit.dart';
import 'package:netsells_test/presentation/widgets/scaffolds/common_scaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    cubit<PostsCubit>(context).getPosts(PostsTypeCredential.Hot);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        return CommonScaffold(
          isLoading: state is PostsLoadingState,
          body: ListView(
            children: (state is PostsLoadedState)
                ? state.posts.children.map((post) => Text(post.title)).toList()
                : [],
          ),
        );
      },
    );
  }
}
