import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PostDetails extends Equatable {
  final String authorFullname;
  final String title;
  final String selftext;
  final String url;

  PostDetails({
    @required this.authorFullname,
    @required this.title,
    @required this.selftext,
    @required this.url,
  });

  @override
  List<Object> get props => [
        authorFullname,
        title,
        selftext,
      ];
}
