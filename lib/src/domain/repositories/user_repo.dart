import 'package:fudge_financial_app/src/core/resources/response_state.dart';
import 'package:fudge_financial_app/src/data/models/user.dart';

abstract class UserRepository {
  Future<DataState<List<User>>> getUsers();
}
