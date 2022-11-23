import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/data/db_helper.dart';

class BancoPage extends StatefulWidget {
  const BancoPage({Key? key}) : super(key: key);

  @override
  State<BancoPage> createState() => _BancoPageState();
}

final form = GlobalKey<FormState>();
final TextEditingController _controller = TextEditingController();


class _BancoPageState extends State<BancoPage> {

AlertDialog dialog = AlertDialog(
  title: Text("atualizar banco"),
  content: Column(
    children: [
      Form(
        key: form,
        child: TextFormField(
          controller: _controller,
          validator: (value){
            if(value!.isEmpty) return 'digite algo!';
            return null;
          },
        ),
      ),
      TextButton(onPressed: (){}, child: child)
    ],
  ),
);

void onPressed(){
 dialog;
}


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            enabled: false,
          ),
          SizedBox(height: 24,),
          ElevatedButton(onPressed: onPressed, child: Text("mudar valor"))
        ],
      ),
    );
  }
}
