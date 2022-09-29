import 'dart:convert';
import 'package:sqflite/sqlite_api.dart';

import '../domain/contas.dart';
import 'db_helper.dart';

class ContasDao {

  Future<List<Contas>> listarContas() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM contas';
    var result = await db.rawQuery(sql);

    List<Contas> lista = <Contas>[];
    for (var json in result) {
      Contas contas = Contas.fromJson(json);
      lista.add(contas);
    }

    return lista;
  }

}