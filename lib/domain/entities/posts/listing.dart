import 'package:equatable/equatable.dart';
import 'package:netsells_test/domain/entities/posts/posts.dart';
import 'package:meta/meta.dart';

class Listing extends Equatable {
  final String kind;
  final Posts data;

  Listing({
    @required this.kind,
    @required this.data,
  });

  @override
  List<Object> get props => [
        kind,
        data,
      ];
}
