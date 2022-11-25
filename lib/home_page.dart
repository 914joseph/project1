import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/api_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  List<Widget> pages = <Widget>[
    ApiPage(),
    Center(child: Text("to do")),
    Center(child: Text("to do"))
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.signal_cellular_alt_outlined),
                label: 'API Call'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dataset_outlined),
                label: 'SQLite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_fire_department_outlined),
                label: 'Firebase'),
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

      body: pages[_selectedIndex],

    );
  }
}
