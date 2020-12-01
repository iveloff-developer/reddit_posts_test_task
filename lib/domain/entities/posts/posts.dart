import 'package:equatable/equatable.dart';
import 'package:netsells_test/domain/entities/posts/post.dart';
import 'package:meta/meta.dart';

class Posts extends Equatable {
  final List<Post> children;

  Posts({@required this.children});

  @override
  List<Object> get props => [children];
}
