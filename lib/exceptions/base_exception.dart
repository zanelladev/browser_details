class BaseException implements Exception {
  final String message;
  final StackTrace stackTrace;

  BaseException({
    this.message = 'Browser Details: an error occurred',
    this.stackTrace = StackTrace.empty,
  });
}
