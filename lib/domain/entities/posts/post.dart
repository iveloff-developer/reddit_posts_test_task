import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String authorFullname;
  final String selftext;

  Post({
    this.authorFullname,
    this.selftext,
  });

  @override
  List<Object> get props => [authorFullname, selftext];
}
