import 'package:flutter/material.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final Function() onTap;
  final bool? isLoading;

  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.width,
      this.height,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {
          if (isLoading == true) {
            return;
          }

          onTap();
        },
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: (isLoading != null && isLoading!)
            ? Center(
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child:
                        const CircularProgressIndicator(color: Colors.white)))
            : Center(
                child: Text(
                text,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFF8F9FA)),
              )),
      ),
    );
  }
}
