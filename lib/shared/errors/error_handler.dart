import 'dart:developer';

import 'package:ml_invest_app/shared/utils/snackbar_util.dart';

import 'models/app_exceptions.dart';

class ErrorHandler {
  static void handleError(error) {
    print(error.toString());
    if (error is BadRequestException) {
      var message = error.details;
      SnackbarUtil.showSnackbar(SnackbarEnum.error, 'Atenção',
          message ?? 'Valide os campos informados.');
      return;
    } else if (error is FetchDataException) {
      var message = error.details;
      log(error.status.toString());
      SnackbarUtil.showSnackbar(SnackbarEnum.error, 'Erro',
          message ?? 'Infelizmente houve um problema inesperado.');
      return;
    } else if (error is ApiNotRespondingException) {
      SnackbarUtil.showSnackbar(
          SnackbarEnum.error, 'Erro', 'Houve um problema na comunicação.');
      return;
    }
    SnackbarUtil.showSnackbar(SnackbarEnum.error, 'Erro', 'Houve um problema ao realizar solicitação.');
    return;
  }
}
