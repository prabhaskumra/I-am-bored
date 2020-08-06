import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    sql.openDatabase(path.join(dbPath, 'places.db'), onCreate: (db, version) {
      return db.execute('sql');
    }, version: 1);
  }
}
