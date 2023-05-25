import 'package:flutter/material.dart';
import 'package:ml_invest_app/shared/widgets/need_login.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NeedLogin(() => Center(child: Text("Logado conta")));
  }
}
