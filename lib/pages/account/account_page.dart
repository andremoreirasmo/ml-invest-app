import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';
import 'package:ml_invest_app/shared/widgets/need_login.dart';

class AccountPage extends StatelessWidget {
  final LoginController _loginController = Get.find();
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
                children: [
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
                  Icon(Icons.account_circle, size: 120, color: Colors.white),
                  Text(
                    _loginController.user.value!.name!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    _loginController.user.value!.email!,
                    style: TextStyle(
                      color: Colors.white,
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
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.calendar_today_sharp,
                                      color: Colors.white, size: 20),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Ativo há",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "115 dias",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30, right: 10),
                                  child: Icon(Icons.calendar_month_outlined,
                                      color: Colors.white),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Registrado desde",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      "12/Mar/2023",
                                      style: TextStyle(
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
                margin: EdgeInsets.only(bottom: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.lightBackgroundColor,
                ),
                child: Column(children: [
                  Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
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
}
