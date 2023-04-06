import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ml_invest_app/shared/errors/models/app_exceptions.dart';

class HttpClient {
  Future<dynamic> get(String url) async {
    try {
      await Future<void>.delayed(const Duration(milliseconds: 1000));
      http.Response response = await http.get(Uri.tryParse(url)!);

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('Sem conexão com a internet.');
    } on TimeoutException {
      throw ApiNotRespondingException('Erro de comunicação.');
    }
  }

  //Todo: Revisar
  dynamic _processResponse(http.Response response) {
    var result = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        return result;
      case 400:
        throw BadRequestException(
            result['message'], result['status'], result['responseCode']);
      case 401:
      case 403:
        throw UnauthorizedException(
            result['message'], result['status'], result['responseCode']);
      case 500:
      default:
        throw FetchDataException(
            result['message'], result['status'], result['responseCode']);
    }
  }
}
