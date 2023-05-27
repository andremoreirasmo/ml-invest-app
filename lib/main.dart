import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/compare_stock/compare_stock_page.dart';
import 'package:ml_invest_app/pages/detail_stock_page/detail_stock_page.dart';
import 'package:ml_invest_app/pages/history_page/history_page.dart';
import 'package:ml_invest_app/pages/home/home_page.dart';
import 'package:ml_invest_app/pages/login/login_page.dart';
import 'package:ml_invest_app/pages/select_compare_stock_page/select_compare_stock_page.dart';
import 'package:ml_invest_app/pages/signup/signup_page.dart';
import 'package:ml_invest_app/pages/splash_screen/splash_screen.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';
import 'package:ml_invest_app/shared/utils/material_color.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/widgets/fab_bottom_app_bar.dart';

import 'pages/about_page.dart';
import 'pages/account/account_page.dart';
import 'shared/bindings/root_binding.dart';

Future<void> main() async {
  runApp(GetMaterialApp(
    theme: ThemeData(
        primarySwatch: createMaterialColor(AppColors.darkGreen),
        scaffoldBackgroundColor: AppColors.backgroundColor),
    initialRoute: Routes.splash,
    getPages: [
      GetPage(
          name: Routes.splash,
          page: () => const SplashScreen(),
          binding: RootBinding()),
      GetPage(
          name: Routes.home,
          page: () => const MyHomePage(),
          binding: RootBinding()),
      GetPage(name: Routes.compareStock, page: () => CompareStockPage()),
      GetPage(name: Routes.detailStock, page: () => DetailStockPage()),
      GetPage(
          name: Routes.selectToCompareStock,
          page: () => SelectCompareStockPage()),
      GetPage(name: Routes.login, page: () => LoginPage()),
      GetPage(name: Routes.signUp, page: () => SignUpPage()),
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
    AccountPage(),
    const AboutPage(),
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
          child: const Icon(
            Icons.currency_exchange,
            color: AppColors.green,
          )),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: Colors.grey,
        selectedColor: AppColors.green,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        backgroundColor: AppColors.lightBackgroundColor,
        selectedIndex: _index,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.history, text: 'Histórico'),
          FABBottomAppBarItem(iconData: Icons.account_circle, text: 'Perfil'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Sobre'),
        ],
      ),
    );
  }
}
