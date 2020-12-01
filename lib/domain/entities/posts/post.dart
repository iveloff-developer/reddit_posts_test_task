import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Post extends Equatable {
  final String authorFullname;
  final String selftext;

  Post({
    @required this.authorFullname,
    @required this.selftext,
  });

  @override
  List<Object> get props => [authorFullname, selftext];
}
