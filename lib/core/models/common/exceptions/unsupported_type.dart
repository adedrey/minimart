class UnsupportedTypeException implements Exception {
  UnsupportedTypeException(this.message);

  final String message;

  @override
  String toString() => 'UnsupportedTypeException: $message';
}
