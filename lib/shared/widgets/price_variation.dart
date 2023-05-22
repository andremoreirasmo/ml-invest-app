import 'package:flutter/material.dart';
import 'package:ml_invest_app/shared/utils/number_util.dart';

class PriceVariation extends StatelessWidget {
  final num regularMarketChange;
  final num regularMarketChangePercent;
  final double? fontSize;

  const PriceVariation(
      {super.key,
      required this.regularMarketChange,
      required this.regularMarketChangePercent,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${NumberUtil.formatValue(regularMarketChange)} (${NumberUtil.formatValue(regularMarketChangePercent)}%)",
      style: TextStyle(color: _getColor(), fontSize: fontSize ?? 20),
    );
  }

  Color _getColor() {
    if (regularMarketChange > 0) {
      return Colors.green;
    } else if (regularMarketChange < 0) {
      return Colors.red;
    }

    return Colors.white;
  }
}
