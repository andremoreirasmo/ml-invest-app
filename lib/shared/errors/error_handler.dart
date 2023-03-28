import 'dart:developer';

import 'package:get/get.dart';

import 'models/app_exceptions.dart';

class ErrorHandler {
  static void handleError(error) {
    if (error is BadRequestException) {
      var message = error.details;
      Get.snackbar('Atenção', message ?? 'Valide os campos informados.');
      return;
    } else if (error is FetchDataException) {
      var message = error.details;
      log(error.status.toString());
      Get.snackbar(
          'Erro', message ?? 'Infelizmente houve um problema inesperado.');
      return;
    } else if (error is ApiNotRespondingException) {
      Get.snackbar('Erro', 'Houve um problema na comunicação.');
      return;
    }
    Get.snackbar('Erro', 'Houve um problema ao realizar solicitação.');
    return;
  }
}
