extension StringExtension on String {
  String onlyCapitalizeFirst() => "${this[0].toUpperCase()}${substring(1)}";
}
