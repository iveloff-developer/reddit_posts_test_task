import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:meta/meta.dart';

abstract class NetworkController {
  Future<bool> hasConnection();
}

class NetworkControllerImpl implements NetworkController {
  final DataConnectionChecker dataConnectionChecker;

  NetworkControllerImpl({@required this.dataConnectionChecker});

  @override
  Future<bool> hasConnection() async {}
}
