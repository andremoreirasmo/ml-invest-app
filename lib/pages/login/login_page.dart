import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ml_invest_app/shared/controllers/login_controller.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/widgets/custom_button.dart';
import 'package:ml_invest_app/shared/widgets/custom_formfield.dart';
import 'package:ml_invest_app/shared/widgets/custom_header.dart';
import 'package:ml_invest_app/shared/widgets/custom_richtext.dart';
import 'package:ml_invest_app/shared/widgets/password_formfield.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.find();

  LoginPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  String get email => _emailController.text.trim();

  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: AppColors.darkGreen,
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        top: 8, left: MediaQuery.of(context).size.width * 0.09),
                    child: Lottie.asset(
                      'assets/lottie/sign-in.json',
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                    headingText: "Email",
                    hintText: "Email",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _emailController,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PasswordFormField(
                    headingText: "Senha",
                    hintText: "Pelo menos 8 caracteres",
                    controller: _passwordController,
                    onSubmitted: (_) => _login(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(() => CustomButton(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.05,
                        onTap: _login,
                        text: 'Entrar',
                        isLoading: _loginController.isLogIn.value,
                      )),
                  CustomRichText(
                    discription: "Não tem uma conta ainda? ",
                    text: "Cadastrar",
                    onTap: () => Get.toNamed(Routes.signUp),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  _login() async {
    var result = await _loginController.login(email, password);

    if (result) {
      Get.back();
    }
  }
}
