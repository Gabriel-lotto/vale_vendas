import '../utils/debug.log.improvement.dart';

abstract class Failure implements Exception {
  final String message;
  final String label;
  final dynamic exception;
  final StackTrace? stacktrace;

  Failure({
    this.stacktrace,
    this.label = '',
    this.exception,
    this.message = '',
  });
}

class UnexpectedError extends Failure {
  UnexpectedError({
    super.message = 'UnexpectedError',
    super.label = 'UnexpectedError',
    super.exception,
    super.stacktrace,
  }) {
    devLog(
      exception?.toString() ?? message,
      stackTrace: stacktrace,
      error: exception,
      name: 'UnexpectedError',
    );
  }
}

class ConnectionError extends Failure {
  ConnectionError({
    super.message = 'ConnectionError',
    super.label = 'ConnectionError',
    super.exception,
    super.stacktrace,
  });
}
