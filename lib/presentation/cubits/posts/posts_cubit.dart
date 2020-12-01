import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netsells_test/common/exceptions/no_internet_exception.dart';
import 'package:netsells_test/common/exceptions/server_exception.dart';
import 'package:netsells_test/domain/credentials/posts/posts_sort_credential.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';
import 'package:netsells_test/domain/repositories/posts/posts_repository.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepository repository;

  PostsCubit({@required this.repository}) : super(PostsInitialState());

  Future<void> getPosts(PostsSortCredential credential) async {
    emit(PostsLoadingState());
    try {
      final posts = await repository.getPosts(credential);
      emit(PostsLoadedState(posts: posts));
    } on ServerException catch (e) {
      emit(PostsErrorState(message: e.message));
    } on NoInternetException catch (e) {
      emit(PostsErrorState(message: e.message));
    }
  }
}
