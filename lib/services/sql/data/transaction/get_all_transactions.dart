import '../../../../models/model_transaction.dart';
import '../../sql_service.dart';

Future<SQLResponse<List<Transaction>>> getAllTransactions() async {
  final response = await sqlService.read<List<Transaction>>(
    SQLParam<List<Transaction>>(
      table: SQLTable.transactions,
      fromJson: (transactions) => transactions
          .map((transaction) => Transaction.fromJson(transaction))
          .toList(),
    ),
  );
  return response;
}
