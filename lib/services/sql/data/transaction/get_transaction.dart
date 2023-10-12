import '../../../../models/model_transaction.dart';
import '../../sql_service.dart';

Future<SQLResponse<Transaction>> getTransaction(int id) async {
  final response = await sqlService.read<Transaction>(
    SQLParam<Transaction>(
      table: SQLTable.transactions,
      fromJson: (transactions) => Transaction.fromJson(transactions[0]),
      where: "id = ?",
      whereArgs: [id],
    ),
  );

  return response;
}
