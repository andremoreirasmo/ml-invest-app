import 'package:flutter/material.dart';
import 'package:ml_invest_app/shared/styles/app_colors.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({
    Key? key,
    Widget? title,
    List<Widget>? actions,
    Widget? leading,
  }) : super(
            key: key,
            title: title,
            actions: actions,
            centerTitle: false,
            backgroundColor: AppColors.darkGreen,
            toolbarHeight: 43,
            leading: leading);
}
