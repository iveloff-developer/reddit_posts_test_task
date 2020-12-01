import 'package:equatable/equatable.dart';
import 'package:netsells_test/domain/entities/posts/post_details.dart';
import 'package:meta/meta.dart';

class Posts extends Equatable {
  final List<PostDetails> children;

  Posts({@required this.children});

  @override
  List<Object> get props => [children];
}
