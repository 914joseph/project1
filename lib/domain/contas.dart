class Contas {
  late final String? nome;
  late final String? email;
  late final String? senha;
  late final int? id;




  Contas({
     this.senha,
     this.email,
     this.nome,
     this.id
});

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['senha'] = senha;


    return data;
  }

  Contas.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    id = json['id'];
    senha = json['senha'];
    email = json['email'];

  }
















}



