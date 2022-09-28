import 'package:flutter/material.dart';

class BD {
  late String? email;
  late String? senha;

  BD({
  this.email,
  this.senha
  });

  static List<BD> listaBD = [
    BD(email: "email1", senha: "senha0"),
    BD(email: "email2", senha: "senha3"),
    BD(email: "email11", senha: "senha5"),
    BD(email: "email7", senha: "senha4"),

  ];


  void Adicionar(newemail, newsenha){
    senha = senha;
    email = email;
    listaBD.add(BD(email: newemail,senha: newsenha));
  }
}

