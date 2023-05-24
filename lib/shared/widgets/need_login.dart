import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';
import 'package:ml_invest_app/shared/widgets/custom_button.dart';

class NeedLogin extends StatelessWidget {
  const NeedLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Lottie.asset(
              'assets/lottie/lock.json',
              width: 250,
              height: 230,
            ),
            const Text(
              "Você precisa estar logado para acessar esta página.",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              onTap: () => Get.toNamed(Routes.login),
              text: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }
}
