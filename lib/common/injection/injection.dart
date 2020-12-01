import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:netsells_test/common/network/network_controller.dart';
import 'package:netsells_test/data/datasources/posts/posts_remote_datasource.dart';
import 'package:netsells_test/domain/repositories/posts/posts_repository.dart';
import 'package:netsells_test/presentation/cubits/posts/posts_cubit.dart';

final getIt = GetIt.instance;

void setupInjections() {
  // Posts.
  getIt.registerFactory<PostsCubit>(
    () => PostsCubit(
      repository: getIt<PostsRepository>(),
    ),
  );
  getIt.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      rds: getIt<PostsRemoteDatasource>(),
      networkController: getIt<NetworkController>(),
    ),
  );
  getIt.registerLazySingleton<PostsRemoteDatasource>(
    () => PostsRemoteDatasourceImpl(
      client: getIt<Client>(),
    ),
  );

  // Common.
  getIt.registerLazySingleton(() => Client());
  getIt.registerLazySingleton(() => DataConnectionChecker());
  getIt.registerLazySingleton<NetworkController>(
    () => NetworkControllerImpl(
      dataConnectionChecker: getIt<DataConnectionChecker>(),
    ),
  );
}
