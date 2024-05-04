class PriceCoinException implements Exception {
  final String _message;

  PriceCoinException(this._message);

  String get message => _message;

  @override
  toString() => _message;
}