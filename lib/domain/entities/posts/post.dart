import 'package:equatable/equatable.dart';
import 'package:netsells_test/domain/entities/posts/post_details.dart';
import 'package:meta/meta.dart';

class Post extends Equatable {
  final PostDetails data;

  Post({@required this.data});

  @override
  List<Object> get props => [data];
}
