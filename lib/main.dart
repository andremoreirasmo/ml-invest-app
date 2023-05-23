import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ml_invest_app/pages/compare_stock/compare_stock_page.dart';
import 'package:ml_invest_app/pages/detail_stock_page/detail_stock_page.dart';
import 'package:ml_invest_app/pages/history_page.dart';
import 'package:ml_invest_app/pages/home/home_controller.dart';
import 'package:ml_invest_app/pages/home/home_page.dart';
import 'package:ml_invest_app/pages/login/login_page.dart';
import 'package:ml_invest_app/pages/select_compare_stock_page/select_compare_stock_page.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';
import 'package:ml_invest_app/shared/utils/material_color.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/widgets/fab_bottom_app_bar.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(HomeController());
  Get.put(LoginController());

  runApp(GetMaterialApp(
    theme: ThemeData(
        primarySwatch: createMaterialColor(Color.fromRGBO(97, 97, 97, 1)),
        scaffoldBackgroundColor: const Color.fromRGBO(48, 48, 48, 1)),
    initialRoute: '/',
    getPages: [
      GetPage(name: Routes.home, page: () => const MyHomePage()),
      GetPage(name: Routes.compareStock, page: () => CompareStockPage()),
      GetPage(name: Routes.detailStock, page: () => DetailStockPage()),
      GetPage(
          name: Routes.selectToCompareStock,
          page: () => SelectCompareStockPage()),
      GetPage(name: Routes.login, page: () => LoginPage()),
    ],
  ));
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
    HistoryPage(),
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
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    if (Get.arguments != null && Get.arguments != _index) {
      _selectedTab(Get.arguments);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_index],
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.selectToCompareStock);
        },
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
        selectedIndex: _index,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.history, text: 'Histórico'),
          FABBottomAppBarItem(iconData: Icons.account_circle, text: 'Conta'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Sobre'),
        ],
      ),
    );
  }
}
