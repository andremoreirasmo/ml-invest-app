import 'package:flutter/material.dart';

class WidgetUtil {
  static List<Widget> getWidgets(int amount, Function() getWidget) {
    List<Widget> widgets = [];

    for (int i = 0; i < amount; i++) {
      widgets.add(getWidget());
    }

    return widgets;
  }

  static Widget showIf(bool value, Function() getWidget, {Function()? elsif}) {
    return (value)
        ? getWidget()
        : elsif != null
            ? elsif()
            : const SizedBox.shrink();
  }

  static Widget showLoading(bool isLoading, Function() getWidget) {
    return (isLoading)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : getWidget();
  }
}
