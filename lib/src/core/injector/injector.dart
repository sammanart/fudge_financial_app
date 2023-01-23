import 'package:fudge_financial_app/src/config/env.dart';
import 'package:fudge_financial_app/src/core/utils/dio_client.dart';
import 'package:fudge_financial_app/src/data/repositories/user_repo.dart';
import 'package:fudge_financial_app/src/domain/repositories/user_repo.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> call(AppEnvironment env) async {
  // Environment
  injector.registerSingleton<AppEnvironment>(env);

  /// Client
  injector.registerSingleton<DioClient>(DioClient());

  /// Repositories
  injector.registerSingleton<UserRepository>(
    UserRepositoryImpl(client: injector<DioClient>().dio),
  );
}
