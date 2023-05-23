import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ml_invest_app/shared/utils/routes.dart';

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
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.login),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
