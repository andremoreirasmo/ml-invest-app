import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';
import 'package:ml_invest_app/shared/widgets/need_login.dart';

class HistoryPage extends StatelessWidget {
  final LoginController _loginController = Get.find();

  HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NeedLogin(() => Center(child: Text("Logado"))));
  }
}