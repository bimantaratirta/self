import '../../../../models/model_user.dart';
import '../../sql_service.dart';

Future<SQLResponse<User>> getUser(int userId) async {
  final response = await sqlService.read<User>(
    SQLParam<User>(
      table: SQLTable.user,
      fromJson: (listUser) => listUser
          .map((user) => User.fromJson(user))
          .toList()
          .firstWhere((user) => user.id == userId),
    ),
  );
  return response;
}
