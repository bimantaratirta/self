import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLTable {
  static const String user = "User";
  static const String transactions = "Transactions";
}

class SQLParam<T> {
  final String table;
  final Map<String, Object>? value;
  final List<String>? columns;
  final String? where;
  final List<Object>? whereArgs;
  final T Function(List<Map<String, Object?>>) fromJson;

  SQLParam({
    required this.table,
    this.value,
    this.columns,
    this.where,
    this.whereArgs,
    required this.fromJson,
  });
}

class SQLResponse<T> {
  T? data;
  dynamic error;
  SQLResponse(this.data, this.error);
}

class SQLService {
  Future<Database> openDb() async {
    String dbPath = await getDatabasesPath();
    final path = join(dbPath, "self.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          """
          CREATE TABLE ${SQLTable.user}(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          image TEXT,
          name TEXT,
          balance REAL
          )
          """,
        );
        await db.execute(
          """
          CREATE TABLE ${SQLTable.transactions}(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          user_id INTEGER,
          image TEXT,
          name TEXT,
          status TEXT,
          amount REAL,
          date TEXT,
          time TEXT,
          FOREIGN KEY (user_id) REFERENCES ${SQLTable.user}(id)
          )
          """,
        );
      },
    );
  }

  Future<SQLResponse<int>> insert<int>(SQLParam param) async {
    final db = await openDb();
    try {
      final id = await db.insert(param.table, param.value!);
      final result = SQLResponse<int>(id as int?, null);
      return result;
    } on DatabaseException catch (error) {
      final result = SQLResponse<int>(null, error);
      return result;
    }
  }

  Future<SQLResponse<T>> read<T>(SQLParam param) async {
    final db = await openDb();
    try {
      final dbQuery = await db.query(
        param.table,
        columns: param.columns,
        where: param.where,
        whereArgs: param.whereArgs,
      );
      final decoded = param.fromJson(dbQuery);
      final result = SQLResponse<T>(decoded, null);
      return result;
    } on DatabaseException catch (error) {
      final result = SQLResponse<T>(null, error);
      return result;
    }
  }

  Future<SQLResponse<int>> update<int>(SQLParam param) async {
    final db = await openDb();
    try {
      final id = await db.update(
        param.table,
        param.value!,
        where: param.where,
        whereArgs: param.whereArgs,
      );
      final result = SQLResponse<int>(id as int?, null);
      return result;
    } on DatabaseException catch (error) {
      final result = SQLResponse<int>(null, error);
      return result;
    }
  }

  Future<SQLResponse<int>> delete<int>(SQLParam param) async {
    final db = await openDb();
    try {
      final id = await db.delete(
        param.table,
        where: param.where,
        whereArgs: param.whereArgs,
      );
      final result = SQLResponse<int>(id as int?, null);
      return result;
    } on DatabaseException catch (error) {
      final result = SQLResponse<int>(null, error);
      return result;
    }
  }
}

final SQLService sqlService = SQLService();
