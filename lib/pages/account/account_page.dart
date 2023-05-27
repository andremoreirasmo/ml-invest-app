import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/pages/account/account_controller.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';
import 'package:ml_invest_app/shared/utils/date_util.dart';
import 'package:ml_invest_app/shared/widgets/need_login.dart';

class AccountPage extends StatelessWidget {
  final AccountController _controller = AccountController();
  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NeedLogin(() => SafeArea(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 30, left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Perfil",
                    style: TextStyle(
                        color: Color(0xFFF8F9FA),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle,
                      size: 120, color: Colors.white),
                  Text(
                    _controller.user.name!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _controller.user.email!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.lightBackgroundColor,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: const Icon(Icons.calendar_today_sharp,
                                      color: Colors.white, size: 20),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Ativo há",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "${DateUtil.daysBetween(DateTime.now(), _controller.user.createdAt!)} dias",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 30, right: 10),
                                  child: const Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.white),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Registrado desde",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      DateUtil.formatDate('dd/MMM/yyyy',
                                          _controller.user.createdAt!),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.lightBackgroundColor,
                ),
                child: Column(children: [
                  Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () => _showMessageToDelete(),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: const [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Excluir conta",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () => _controller.logout(),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: const [
                            Icon(Icons.logout, color: Colors.grey),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            )
          ],
        )));
  }

  _showMessageToDelete() {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        titleTextStyle: const TextStyle(color: Colors.white),
        contentTextStyle: const TextStyle(color: Colors.white),
        title: const Text('Confirmação'),
        content: const Text(
            'Você tem certeza de que deseja deletar sua conta? Este processo é irreversível.'),
        actions: [
          TextButton(
            onPressed: () =>
                Get.back(result: false), // User cancelled the delete operation
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () =>
                Get.back(result: true), // User confirmed the delete operation
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    ).then((value) {
      if (value != null && value) {
        _controller.deleteUser();
      }
    });
  }
}
