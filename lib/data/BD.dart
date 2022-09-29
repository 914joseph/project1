import '../domain/contas.dart';

class BDD {
  static List<Contas> listaContas = [

  ];

  static Future<List<Contas>>  listarContas() async {
    print("ANTES");
    await Future.delayed(const Duration(seconds: 5));
    print("DEPOIS");
    return listaContas;
  }





}