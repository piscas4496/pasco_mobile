class BaseException implements Exception {
  BaseException({this.path, this.title, this.message, this.statusCode});

  final String? path;
  final String? title;
  final String? message;
  final int? statusCode;
}

class UnauthenticatedException extends BaseException {
  UnauthenticatedException(
      {String? path, String? title, String? message, int? statusCode})
      : super(
          path: path,
          title: title,
          message: message,
          statusCode: statusCode,
        );
}

class UndefinedException extends BaseException {
  UndefinedException(
      {String? path, String? title, String? message, int? statusCode})
      : super(
          path: path,
          title: title,
          message: message,
          statusCode: statusCode,
        );
}

class ApiNotRespondingException extends BaseException {
  ApiNotRespondingException(
      {String? path, String? title, String? message, int? statusCode})
      : super(
          path: path,
          title: title,
          message: message,
          statusCode: statusCode,
        );
}

class ConnectivityException extends BaseException {
  ConnectivityException(
      {String? path, String? title, String? message, int? statusCode})
      : super(
          path: path,
          title: title,
          message: message,
          statusCode: statusCode,
        );
}

class ServerErrorException extends BaseException {
  ServerErrorException(
      {String? path, String? title, String? message, int? statusCode})
      : super(
          path: path,
          title: title,
          message: message,
          statusCode: statusCode,
        );
}

class NotFoundErrorException extends BaseException {
  NotFoundErrorException(
      {String? path, String? title, String? message, int? statusCode})
      : super(
          path: path,
          title: title,
          message: message,
          statusCode: statusCode,
        );
}

class ValidationErrorException extends BaseException {
  ValidationErrorException(
      {String? path, String? title, String? message, int? statusCode})
      : super(
          path: path,
          title: title,
          message: message,
          statusCode: statusCode,
        );
}
