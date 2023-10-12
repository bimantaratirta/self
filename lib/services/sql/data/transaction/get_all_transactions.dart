import '../../../../models/model_transaction.dart';
import '../../../../utils/get_user_id.dart';
import '../../sql_service.dart';

Future<SQLResponse<List<Transaction>>> getAllTransactions({
  String where = "",
  List<Object> whereArgs = const [],
}) async {
  final userId = await getUserId();
  final response = await sqlService.read<List<Transaction>>(
    SQLParam<List<Transaction>>(
      table: SQLTable.transactions,
      fromJson: (transactions) => transactions
          .map((transaction) => Transaction.fromJson(transaction))
          .toList(),
      where: "user_id = ? $where",
      whereArgs: [userId, ...whereArgs],
    ),
  );
  return response;
}
