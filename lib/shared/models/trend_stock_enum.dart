import 'package:flutter/material.dart';

enum TrendStockEnum {
  up,
  flat,
  down,
}

TrendStockEnum trendStockFromJson(int? json) {
  switch (json) {
    case 0:
      return TrendStockEnum.up;
    case 1:
      return TrendStockEnum.flat;
    case 2:
      return TrendStockEnum.down;
    default:
      return TrendStockEnum.flat;
  }
}

extension TrendStockEnumExtension on TrendStockEnum {
  String get description {
    switch (this) {
      case TrendStockEnum.up:
        return 'Tendência de alta';
      case TrendStockEnum.flat:
        return 'Neutro';
      case TrendStockEnum.down:
        return 'Tendência de baixa';
      default:
        return '';
    }
  }

  String get image {
    switch (this) {
      case TrendStockEnum.up:
        return 'assets/images/high.png';
      case TrendStockEnum.down:
        return 'assets/images/low.png';
      default:
        return 'assets/images/neutral.png';
    }
  }

  IconData get icon {
    switch (this) {
      case TrendStockEnum.up:
        return Icons.trending_up;
      case TrendStockEnum.down:
        return Icons.trending_down;
      default:
        return Icons.trending_flat;
    }
  }

  Color get color {
    switch (this) {
      case TrendStockEnum.up:
        return Colors.green;
      case TrendStockEnum.down:
        return Colors.red;
      default:
        return Colors.white;
    }
  }
}
