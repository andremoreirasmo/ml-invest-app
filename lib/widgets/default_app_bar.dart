import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
            backgroundColor: const Color.fromRGBO(69, 89, 62, 1),
            toolbarHeight: 43,
            leading: leading);
}
