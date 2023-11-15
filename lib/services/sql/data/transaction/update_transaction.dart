import '../../../../models/model_transaction.dart';
import '../../sql_service.dart';

Future<SQLResponse> updateTransaction(
  Transaction transaction,
) async {
  final Map<String, Object> value = {};
  transaction.toJson().forEach((k, v) => value[k] = v);
  final response = await sqlService.update(
    SQLParam(
      table: SQLTable.transactions,
      fromJson: (transactions) => Transaction.fromJson(transactions[0]),
      value: value,
      where: "id = ?",
      whereArgs: [transaction.id!],
    ),
  );

  return response;
}
