import '../../../../models/model_transaction.dart';
import '../../sql_service.dart';
import '../user/get_user.dart';

Future<SQLResponse<int>> postTransaction(Transaction transaction) async {
  final Map<String, Object> value = {};
  transaction.toJson().forEach((k, v) {
    if (transaction.toJson()[k] != null) value[k] = v;
  });
  final response = await sqlService.insert<int>(
    SQLParam<int>(
      table: SQLTable.transactions,
      fromJson: (_) => 0,
      value: value,
    ),
  );

  final user = (await getUser(transaction.userId!)).data;

  final newBalance = transaction.status == "pemasukan"
      ? user!.balance! + transaction.amount!
      : user!.balance! - transaction.amount!;
  final Map<String, Object> valueUser = {"balance": newBalance};

  await sqlService.update(
    SQLParam(
      table: SQLTable.user,
      fromJson: (_) {},
      where: "id=?",
      value: valueUser,
      columns: ["balance"],
      whereArgs: [transaction.userId!],
    ),
  );

  return response;
}
