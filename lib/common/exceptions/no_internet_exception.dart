import 'package:equatable/equatable.dart';

class NoInternetException extends Equatable implements Exception {
  final String message;

  NoInternetException() : message = 'NoInternetException';

  @override
  List<Object> get props => [message];
}
