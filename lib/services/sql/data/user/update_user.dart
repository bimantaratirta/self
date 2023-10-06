import '../../../../models/model_user.dart';
import '../../sql_service.dart';

Future<SQLResponse<User>> updateUser(User user) async {
  final response = await sqlService.update<User>(
    SQLParam(
      table: SQLTable.user,
      fromJson: (listUser) => listUser
          .map((user) => User.fromJson(user))
          .toList()
          .firstWhere((user) => user.id == user.id),
    ),
  );

  return response;
}
