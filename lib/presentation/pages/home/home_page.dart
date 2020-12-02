import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netsells_test/common/network/rest_endpoints.dart';
import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';
import 'package:netsells_test/presentation/cubits/cubit_helper.dart';
import 'package:netsells_test/presentation/cubits/posts/posts_cubit.dart';
import 'package:netsells_test/presentation/pages/home/widgets/home_app_bar.dart';
import 'package:netsells_test/presentation/pages/home/widgets/home_drawer.dart';
import 'package:netsells_test/presentation/pages/home/widgets/home_list_view.dart';
import 'package:netsells_test/presentation/widgets/scaffolds/common_scaffold.dart';

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

  void onTabTap(int newValue) {
    setState(() {
      sortCredential = PostsSortCredential.values[newValue];
    });
    _getPosts();
  }

  void onHomeDrawerItemPressed(RestEndpoints newEndpoint) {
    setState(() {
      endpoint = newEndpoint;
    });
    _getPosts();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return CommonScaffold(
          isLoading: state is PostsLoadingState,
          appBar: HomeAppBar(title: endpoint.value, onTabTap: onTabTap),
          drawer: HomeDrawer(onItemPressed: onHomeDrawerItemPressed),
          body: HomeListView(
            endpoint: endpoint,
            sortCredential: sortCredential,
          ),
        );
      },
    );
  }
}
