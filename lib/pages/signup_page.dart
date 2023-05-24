import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';
import 'package:ml_invest_app/shared/widgets/custom_button.dart';
import 'package:ml_invest_app/shared/widgets/custom_formfield.dart';
import 'package:ml_invest_app/shared/widgets/custom_header.dart';
import 'package:ml_invest_app/shared/widgets/password_formfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _userName = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get userName => _userName.text.trim();
  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.darkGreen,
          ),
          const CustomHeader(
            text: 'Sign Up',
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
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
                    textInputAction: TextInputAction.done,
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
                    textInputAction: TextInputAction.done,
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
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PasswordFormField(
                    headingText: "Confirme a senha",
                    hintText: "Confirme a senha",
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.05,
                    onTap: () {},
                    text: 'Sign Up',
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
