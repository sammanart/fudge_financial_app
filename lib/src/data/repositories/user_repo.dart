import 'package:dio/dio.dart';
import 'package:fudge_financial_app/src/config/api_endpoints.dart';
import 'package:fudge_financial_app/src/data/models/user.dart';
import 'package:fudge_financial_app/src/core/resources/response_state.dart';
import 'package:fudge_financial_app/src/domain/repositories/user_repo.dart';

class UserRepositoryImpl extends UserRepository {
  final Dio client;

  UserRepositoryImpl({required this.client});
  @override
  Future<DataState<List<User>>> getUsers() async {
    const endpoint = ApiEndpoints.users;

    try {
      final res = await client.get(endpoint);
      return DataSuccess(res.data.map<User>((e) => User.fromJson(e)).toList());
    } catch (e) {
      return DataFailed(e);
    }
  }
}
