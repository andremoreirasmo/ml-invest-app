import 'package:flutter/material.dart';
import 'package:ml_invest_app/widgets/fab_bottom_app_bar.dart';
import 'package:ml_invest_app/widgets/stocks_by_trend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
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
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 250.0,
                backgroundColor: const Color.fromRGBO(97, 97, 97, 1),
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('ML Invest'),
                  background: Container(
                      padding: const EdgeInsets.only(top: 45),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Image(
                              image: AssetImage(
                                  'assets/images/undraw_robotics_kep.png')),
                        ],
                      )),
                ),
              ),
            ];
          },
          body: Container(
            color: const Color.fromRGBO(48, 48, 48, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                StocksByTrend(title: 'Tendência de alta'),
                StocksByTrend(title: 'Neutro'),
                StocksByTrend(title: 'Tendência de baixa'),
              ],
            ),
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
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
          FABBottomAppBarItem(iconData: Icons.info, text: 'Info'),
        ],
      ),
    );
  }
}
