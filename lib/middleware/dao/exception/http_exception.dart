import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'http_exception.freezed.dart';

@freezed
abstract class HttpException with _$HttpException implements Exception {
  const factory HttpException.connection({
    @required String message,
    Exception cause,
  }) = _Connection;
  const factory HttpException.response({
    @required int statusCode,
    Exception cause,
  }) = _Response;
}
