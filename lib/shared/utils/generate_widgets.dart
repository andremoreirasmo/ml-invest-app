import 'package:flutter/material.dart';

class GenerateWidgets {
  static List<Widget> getWidgets(int amount, Function() getWidget) {
    List<Widget> widgets = [];

    for (int i = 0; i < amount; i++) {
      widgets.add(getWidget());
    }

    return widgets;
  }
}
