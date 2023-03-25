class AppException {
  String? status;
  String? responseCode;
  String? message;
  String? details;

  AppException([this.status, this.responseCode, this.message, this.details]);

  AppException.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    message = json['message'];
  }
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? status, String? responseCode])
      : super(message, responseCode, status, 'Valide os campos informados.');
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? status, String? responseCode])
      : super(message, responseCode, status, 'Erro inesperado.');
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException(
      [String? message, String? status, String? responseCode])
      : super(message, responseCode, status, 'Erro de comunicação.');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message, String? status, String? responseCode])
      : super(message, responseCode, status, 'Falha na autenticação.');
}
