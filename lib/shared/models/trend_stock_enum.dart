enum TrendStockEnum {
  upward,
  stable,
  downward,
}

extension TrendStockEnumExtension on TrendStockEnum {
  String get description {
    switch (this) {
      case TrendStockEnum.upward:
        return 'Tendência de alta';
      case TrendStockEnum.stable:
        return 'Neutro';
      case TrendStockEnum.downward:
        return 'Tendência de baixa';
      default:
        return '';
    }
  }

  String get image {
    switch (this) {
      case TrendStockEnum.upward:
        return 'assets/images/high.png';
      case TrendStockEnum.downward:
        return 'assets/images/low.png';
      default:
        return 'assets/images/neutral.png';
    }
  }
}
