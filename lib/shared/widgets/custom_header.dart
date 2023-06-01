import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkGreen,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 16, left: 16, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFFF8F9FA),
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    color: Color(0xFFF8F9FA),
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
