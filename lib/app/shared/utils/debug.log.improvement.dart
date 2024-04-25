library dev_tools;

import 'dart:convert';
import 'dart:developer' as dev;

const _jsonEncoder = JsonEncoder.withIndent('  ');

void devLog(Object? object, {String? name, Object? error, StackTrace? stackTrace}) {
  if (object != null && object is Map) {
    dev.log(
      _jsonEncoder.convert(object),
      name: name ?? '',
      error: error,
      stackTrace: stackTrace,
    );
  } else {
    dev.log(
      object?.toString() ?? '',
      name: name ?? '',
      error: error,
    );
  }
}
