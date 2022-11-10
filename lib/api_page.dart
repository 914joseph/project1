import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  Map apitext = {'':''};
  var stringapi = '';
  var textcontainer = 'aperte o botão';
  bool se = false;
  final ScrollController _firstController = ScrollController();

  Future<void> _apiCall() async {
    setState(() {
      textcontainer = "esperando valor";
      se = true;
    });
    apitext = await fetch();
    stringapi = apitext.toString();
    setState(() {
      se = false;
      textcontainer = stringapi;
    });
  }
  
  Future<Map> fetch() async {
    final response = await http
        .get(Uri.parse('https://www.abibliadigital.com.br/api/verses/nvi/sl/23'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Scrollbar(

        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                SizedBox(width: 80,child: ElevatedButton(onPressed: _apiCall, child: se?SizedBox(width: 16,height: 16,child: CircularProgressIndicator(color: Colors.white70,)):Text('Call'))),
                SizedBox(height: 50),
                Container(width: 300,height: 350,decoration: BoxDecoration(color: Colors.lightBlueAccent,borderRadius: BorderRadius.circular(16),border: Border.all()),
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _firstController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(textcontainer),
                    ),
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
