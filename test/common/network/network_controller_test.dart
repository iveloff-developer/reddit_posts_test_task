import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netsells_test/common/network/network_controller.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkController networkController;

  setUp(
    () {
      mockDataConnectionChecker = MockDataConnectionChecker();
      networkController = NetworkControllerImpl(
        dataConnectionChecker: mockDataConnectionChecker,
      );
    },
  );

  test(
    "should call [DataConnectionChecker.hasConnection]",
    () async {
      await networkController.hasConnection();

      verify(mockDataConnectionChecker.hasConnection);
      verifyNoMoreInteractions(mockDataConnectionChecker);
    },
  );
}
