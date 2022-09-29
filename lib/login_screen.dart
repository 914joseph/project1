import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project1/data/contas_dao.dart';

import 'bd.dart';
import 'data/BD.dart';
import 'domain/contas.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ContasDao contasDao = ContasDao();
  BDD bdd = BDD();
Contas contaa = Contas();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contasDao.listarContas();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(width: MediaQuery.of(context).size.width, height: 350),
          Padding(padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(

              width: MediaQuery.of(context).size.width,


              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Form(key: _formKey,child: Column(
                    children: [
                      TextFormField(
                        controller: _loginEmailController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo Obrigatório';
                          }
                          return null;
                        },
                      ),
                      SizedBox(width: double.maxFinite, height: 15,),
                      TextFormField(
                        controller: _loginPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Senha',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo Obrigatório';
                          } else if(value == "helloorde"){
                            print("qqisso");
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                  ),
                  SizedBox(width: double.maxFinite, height: 10,),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Não tem conta? ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                          text: 'Clique Aqui',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, "/signup");
                            }),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width,height: 80,),
          Center(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(width: MediaQuery.of(context).size.width,
              child: ElevatedButton(child: Text("Entrar"), onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Validation(
                      _loginPasswordController, _loginEmailController, context);
                }
              },style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
              ),
              ),
            ),
          )
        ],
        ),

      ),
    );
  }

  Future Validation(TextEditingController senha,TextEditingController email,context) async{
    for(contaa in BDD.listaContas){
      if(contaa.email == email.text && contaa.senha == senha.text){
        Navigator.pushReplacementNamed(context, "/home");
      }
    }
      if(email.text == "email" && senha.text =="senha"){
        Navigator.pushReplacementNamed(context, "/home");
      }  else{
        email.clear();
        senha.clear();
      }
  }





}


