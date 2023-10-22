extension IntExtension on int? {
  int get getValueOrDefault => this ?? 0;
}
