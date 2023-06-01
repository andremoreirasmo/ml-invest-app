import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ml_invest_app/pages/signup/signup_controller.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';
import 'package:ml_invest_app/shared/widgets/custom_button.dart';
import 'package:ml_invest_app/shared/widgets/custom_formfield.dart';
import 'package:ml_invest_app/shared/widgets/custom_header.dart';
import 'package:ml_invest_app/shared/widgets/password_formfield.dart';

class SignUpPage extends StatelessWidget {
  final SignupController _controller = Get.put(SignupController());
  SignUpPage({Key? key}) : super(key: key);

  final _userName = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  String get userName => _userName.text.trim();

  String get email => _emailController.text.trim();

  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Cadastre-se',
      ),
      resizeToAvoidBottomInset: true,
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
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Nome",
                    hintText: "Nome",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                    controller: _userName,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Email",
                    hintText: "Email",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PasswordFormField(
                    headingText: "Senha",
                    hintText: "Pelo menos 8 caracteres",
                    controller: _passwordController,
                    onSubmitted: (_) => _signUp(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    onTap: () => _signUp(),
                    text: 'Cadastrar',
                    isLoading: _controller.isLoading.value,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  _signUp() => _controller.signUp(userName, email, password);
}
