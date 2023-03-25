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
      Get.snackbar('Erro', message ?? 'Erro inesperado.');
      return;
    } else if (error is ApiNotRespondingException) {
      Get.snackbar('Erro', 'Erro de comunicação.');
      return;
    }
    Get.snackbar('Erro', 'Erro ao realizar solicitação.');
    return;
  }
}
