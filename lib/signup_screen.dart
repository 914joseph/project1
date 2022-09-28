import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/bd.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  BD bd = BD();
  late bool itHas= false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itHas = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width,height: 50,),
                Text("Cadastro",style: TextStyle(fontSize: 42,color: Colors.grey),),
                SizedBox(width: MediaQuery.of(context).size.width,height: 30,),
                Form(key: _formKey,child: Column(
                  children: [
                    TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Nome',
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
                      controller: _signupEmailController,
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
                      controller: _signupPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width, height: 50,),
                    Container(width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(child: Text("Cadastrar"), onPressed: (){
                        if(_formKey.currentState!.validate()){
                          for(bd in BD.listaBD){
                            if(bd.email == _signupEmailController.text && bd.senha == _signupPasswordController.text){
                              _signupPasswordController.clear();
                              _signupEmailController.clear();
                              itHas = true;
                            }
                          }
                          if(itHas == true){

                          }else{
                            bd.Adicionar(_signupEmailController.text, _signupPasswordController.text);
                            Navigator.pushReplacementNamed(context, "/login");
                          }
                        }

                      },style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
