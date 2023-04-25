import 'package:ml_invest_app/shared/extesions/string_extension.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

enum ChartPeriodEnum {
  oneDay,
  oneWeek,
  oneMonth,
  oneYear,
  fiveYears,
  max,
}

extension ChartPeriodEnumExtension on ChartPeriodEnum {
  String get label {
    switch (this) {
      case ChartPeriodEnum.oneDay:
        return '1D';
      case ChartPeriodEnum.oneWeek:
        return '1S';
      case ChartPeriodEnum.oneMonth:
        return '1M';
      case ChartPeriodEnum.oneYear:
        return '1A';
      case ChartPeriodEnum.fiveYears:
        return '5A';
      case ChartPeriodEnum.max:
        return 'Max';
      default:
        return '';
    }
  }

  String get queryParam {
    return toString().split('.').last.onlyCapitalizeFirst();
  }

  DateTimeIntervalType get chartIntervalType {
    switch (this) {
      case ChartPeriodEnum.oneDay:
        return DateTimeIntervalType.minutes;
      case ChartPeriodEnum.oneWeek:
      case ChartPeriodEnum.oneMonth:
        return DateTimeIntervalType.days;
      case ChartPeriodEnum.oneYear:
        return DateTimeIntervalType.months;
      case ChartPeriodEnum.fiveYears:
      case ChartPeriodEnum.max:
        return DateTimeIntervalType.years;
      default:
        return DateTimeIntervalType.minutes;
    }
  }
}
