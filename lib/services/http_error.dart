import 'package:flutter/foundation.dart';

@immutable
class HttpError {
  final int code;
  final String message;

  const HttpError({ required this.code, required this.message });
}