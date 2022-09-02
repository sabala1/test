import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './todo_model.dart';

class DBTodo {
  Database? _database;

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'todo.db';
    final path = join(dbpath, dbname);
    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        todoText TEXT,
        dateTime TEXT,
        isDone INTEGER
      )''');
  }

  Future<void> insertTodo(ToDo todo) async {
    final db = await database;
    await db.insert(
      'todo',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTodo(ToDo todo) async {
    final db = await database;
    await db.delete(
      'todo',
      where: 'id == ?',
      whereArgs: [todo.id],
    );
  }

  Future<List<ToDo>> getToDo() async{
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC',
    );
    return List.generate(
        items.length, 
        (i) => ToDo(
          id: items[i]['id'],
          todoText: items[i]['todoText'],
          dateTime: DateTime.parse(items[i]['dateTime']),
          isDone: items[i]['dateTime'] == 1 ? true : false
        ),);
  }
}
