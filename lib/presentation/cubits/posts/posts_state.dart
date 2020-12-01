part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  final Posts posts;

  PostsLoadedState({@required this.posts});

  @override
  List<Object> get props => [posts];
}

class PostsErrorState extends PostsState {
  final String message;

  PostsErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
