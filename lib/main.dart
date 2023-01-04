import 'package:flutter/material.dart';
import 'package:ml_invest_app/pages/home_page.dart';
import 'package:ml_invest_app/pages/list_page.dart';
import 'package:ml_invest_app/utils/material_color.dart';
import 'package:ml_invest_app/widgets/fab_bottom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: createMaterialColor(Color.fromRGBO(97, 97, 97, 1)),
          scaffoldBackgroundColor: const Color.fromRGBO(48, 48, 48, 1)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  final List<Widget> _children = [
    HomePage(),
    ListPage(),
    Center(
      child: Text("Third Page"),
    ),
    Center(
      child: Text("Four Page"),
    ),
  ];

  void _selectedTab(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_index],
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Comparar',
        elevation: 2.0,
        backgroundColor: const Color.fromRGBO(84, 84, 84, 1),
        child: const Icon(Icons.currency_exchange,
            color: Color.fromRGBO(44, 157, 4, 1)),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: Colors.grey,
        selectedColor: const Color.fromRGBO(44, 157, 4, 1),
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        backgroundColor: const Color.fromRGBO(68, 68, 68, 1),
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.list, text: 'Lista'),
          FABBottomAppBarItem(iconData: Icons.account_circle, text: 'Conta'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Sobre'),
        ],
      ),
    );
  }
}
