import 'package:logger/logger.dart';

class DioApiLogger {
  DioApiLogger();

  final Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  final _loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  void demo() {
    logger.d('Log message with 2 methods');

    _loggerNoStack.i('Info message');

    _loggerNoStack.w('Just a warning!');

    logger.e('Error! Something bad happened', error: 'Test Error');

    _loggerNoStack.t({'key': 5, 'value': 'something'});

    Logger(printer: SimplePrinter(colors: true)).t('boom');
  }


  loggerError({required String route, required String error}){
    logger.e('$route Error', error: error);
  }


  loggerTrace(String log){
    logger.t(log);
  }

}