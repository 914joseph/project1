import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  String? newvar;
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, "contas.db");
    Database db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );

    print(databasePath);
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql = 'create table CONTAS (id INTEGER PRIMARY KEY, nome varchar(100), email varchar(100), senha varchar(100));';
    await db.execute(sql);

    sql =
    "INSERT INTO CONTAS (id, nome, email, senha) VALUES (1, 'Josenilton Ferreira', 'jfsj5@aluno.ifal.edu.br', 'senha123');";
    await db.execute(sql);
  }

  Future<FutureOr<void>> onUpgrade(Database db, int oldversion,
      int newversion) async {
    if (oldversion ==1){
      novoBanco(db);
    }
    String sql = 'create table CONTAS (id INTEGER PRIMARY KEY, nome varchar(100), email varchar(100), senha varchar(100));';
    await db.execute(sql);

    sql =
    "INSERT INTO CONTAS (id, nome, email, senha) VALUES (1, 'Josenilton Ferreira', 'jfsj5@aluno.ifal.edu.br', 'senha123');";
    await db.execute(sql);

    sql = 'create table VARIAVEL (id INTEGER PRIMARY KEY, valor varchar(100)';
    sql = "INSERT INTO VARIAVEL(id, valor) VALUES (0,'0')";
  }

  void novoBanco(Database db) {
    db.execute("UPDATE variavel SET valor=$newvar WHERE id=0");
  }

}