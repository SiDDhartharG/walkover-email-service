import 'package:first_flutter_app/structure/email.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EmailDataBase {
  static final EmailDataBase instance = EmailDataBase._init();

  static Database? _database;

  EmailDataBase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('emails.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    // final boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
CREATE TABLE $EmailTableName ( 
  ${EmailStructure.id} $idType,
  ${EmailStructure.fromEmail} $textType,
  ${EmailStructure.toEmail} $textType,
  ${EmailStructure.body} $textType,
  ${EmailStructure.createdAt} $textType
  )
''');
  }

  Future<Email> create(Email email) async {
    final db = await instance.database;
    final id = await db.insert(EmailTableName, email.toJson());
    return email.copy(id: id);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      EmailTableName,
      where: '${EmailStructure.id} = ?',
      whereArgs: [id],
    );
  }

  Future<List<Email>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${EmailStructure.createdAt} ASC';
    // final result =await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');
    final result = await db.query(EmailTableName, orderBy: orderBy);
    return result.map((json) => Email.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
