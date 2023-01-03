import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'WordDTO.dart';

class DbHelper {
  static const dbName = "littlewords.db";
  static const dbPathName = "littlewords.path";
  static const dbVersion = 1;

  //Instance
  static Database? _database;

  // Constructeur
  DbHelper._privateConstructor();

  static final DbHelper instance = DbHelper._privateConstructor();

  Future<Database> get database async => _database ??= await _init();

  Future<Database> _init() async {
    final String dbPath = await getDatabasesPath();

    return await openDatabase(join(dbPathName),
        onCreate: _onCreate, version: dbVersion);
  }

  FutureOr<void> _onCreate(Database db, int version) {
    const String createWordsTableQuery = 'CREATE TABLE words(id integer PRIMARY KEY AUTOINCREMENT, content VARCHAR(200) NOT NULL, uid integer, author varchar(50),latitude double, longitude double)';
    db.execute(createWordsTableQuery);
  }

  FutureOr<void> _onUpgrade(Database db, int olderVersion, int newVersion) {
    const String dropWordsTableQuery = 'DROP TABLE IF EXISTS words';
    db.execute(dropWordsTableQuery);

    _onCreate(db, newVersion);
  }

  Future<void> insert(final WordDTO wordDTO) async {
    Database db = await instance.database;
    final String insertWordQuery =
        "INSERT INTO words (content) values ('${wordDTO.content}')";
    return db.execute(insertWordQuery);
  }

  Future<int> countWords() async {
    final Database db = await instance.database;
    var res = await db.rawQuery('SELECT COUNT(*) FROM words');
    var count = Sqflite.firstIntValue(res);
    return Future.value(count);
  }

  Future<List<WordDTO>> getAllWords() async {
    final Database db = await instance.database;

    final resultSet =
        await db.rawQuery('select * from words');

    final List<WordDTO> results = <WordDTO>[];
    for(var r in resultSet){
      var word = WordDTO.fromJson(r);
      results.add(word);

    }
    return Future.value(results);
  }

}
