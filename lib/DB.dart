import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'definition.dart';

//リポジトリ

final dboperationProvider = Provider((ref) => DBoperation());

class DBoperation {
  //delete
  Future<void> deleteDB(int id) async {
    final db = await db_name;
    await db.delete(
      'folderName',
      where: "id = ?", //検索条件
      whereArgs: [id], //検索条件に対しての実施値
    );
  }

  //UPdate
  Future<void> updateDB(Definition up1) async {
    final db = await db_name;
    await db.update(
      'folderName', //デーブル名
      up1.toMap(), //値を挿入
      where: "id = ?", //検索条件
      whereArgs: [up1.id], //検索条件に対しての実行値
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  //INPUT
  Future<void> insertDB(Definition input1) async {
    final Database db = await db_name;
    await db.insert(
      'folderName', //テーブルネーム
      input1.toMap(), // 値を挿入
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //GET　UIの表示の部分
  Future<List<Definition>> getDB() async {
    final Database? db2 = await db_name;
    final List<Map<String, dynamic>> maps = await db2!.query('folderName');
    return List.generate(maps.length, (i) {
      return Definition(
        id: maps[i]['DBid'],
        name: maps[i]['DBname'],
        tableName: maps[i]['DBtableName'],
      );
    });
  }

  //OPEN　db_nameが呼ばれるたびにOPENしてくれます。いいこと書かれている
  Future<Database> get db_name async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path,
        "WordStocDB.db"); //[path]にはjoinで囲っている、パスが入る（文字列）
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute(
            """CREATE TABLE folderName(DBid INTEGER PRIMARY KEY,DBname TEXT,DBtableName TEXT)"""); //ここでメイン画面のフォルダデータを取得
      },
    );
  }
}
