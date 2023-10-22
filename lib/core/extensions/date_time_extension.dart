extension DateTimeExtension on DateTime? {
  String get getDateTimeInDDMMYYYY {
    return '${this?.day.toString().padLeft(2, '0')}/${this?.month.toString().padLeft(2, '0')}/${this?.year.toString().padLeft(4, '0')}';
  }
}
