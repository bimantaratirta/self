import '../../sql_service.dart';

Future<SQLResponse<int>> deleteTransaction(int id) async {
  final response = await sqlService.delete<int>(
    SQLParam(
      table: SQLTable.transactions,
      fromJson: (_) => {},
      where: "id = ?",
      whereArgs: [id],
    ),
  );

  return response;
}
