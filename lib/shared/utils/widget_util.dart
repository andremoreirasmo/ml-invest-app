import 'package:flutter/material.dart';

class WidgetUtil {
  static List<Widget> getWidgets(int amount, Function() getWidget) {
    List<Widget> widgets = [];

    for (int i = 0; i < amount; i++) {
      widgets.add(getWidget());
    }

    return widgets;
  }

  static Widget showIf(bool value, Function() getWidget) {
    return (value) ? getWidget() : const SizedBox.shrink();
  }
}
