extension ListExtension<T> on List<T>? {
  List<T> get getValueOrDefault => this ?? [];
  bool get isNullOrEmpty => this == null || getValueOrDefault.isEmpty;
  bool get isNotEmpty => !isNullOrEmpty;
}
