import '../../../../models/model_user.dart';
import '../../sql_service.dart';

Future<SQLResponse<User>> getUser(int userId) async {
  final response = await sqlService.read<User>(
    SQLParam<User>(
      table: SQLTable.user,
      fromJson: (users) => User.fromJson(users[0]),
      where: "id = ?",
      whereArgs: [userId],
    ),
  );
  return response;
}
