import '../../../../models/model_transaction.dart';
import '../../sql_service.dart';

Future<SQLResponse<List<Transaction>>> getLimitTransaction(int limit) async {
  final response = await sqlService.read<List<Transaction>>(
    SQLParam(
      table: SQLTable.transactions,
      fromJson: (transactions) => transactions
          .map((transaction) => Transaction.fromJson(transaction))
          .toList(),
      limit: limit,
      orderBy: "id DESC",
    ),
  );

  return response;
}
