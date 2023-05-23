import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:ml_invest_app/shared/errors/models/app_exceptions.dart';
import 'package:ml_invest_app/shared/models/http_client_enum.dart';

class HttpClient {
  Future<dynamic> request(HttpRequestEnum type, String url,
      {Map<String, dynamic>? queryParams, String? authToken}) async {
    try {
      Uri parsedUri = Uri.parse(url);

      if (queryParams != null) {
        parsedUri = parsedUri.replace(queryParameters: queryParams);
      }

      Map<String, String>? headers;
      if (authToken != null) {
        headers = {'Authorization': 'Bearer $authToken'};
      }

      http.Response response;
      switch (type) {
        case HttpRequestEnum.post:
          response = await http.post(parsedUri, headers: headers);
          break;
        default:
          response = await http.get(parsedUri, headers: headers);
      }

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
