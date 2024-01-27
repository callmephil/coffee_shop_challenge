extension StringExtension on String {
  String get orDash => isEmpty ? '-' : this;
  // watermark for mass translations
  String get tr => this;
}

extension NullableExtension on Null {
  String get orEmpty => '';
  String get orDash => '-';
}

extension NullableStringExtension on String? {
  bool get isBlank => this?.trim().isEmpty ?? true;
  String get orEmpty => this ?? '';
  String get orDash => this ?? '-';
}
