class PriceCoinException implements Exception {
  final String? _message;

  PriceCoinException() : _message = null;
  PriceCoinException.message(this._message);

  String? get message => _message;

  @override
  toString() => _message ?? '';
}