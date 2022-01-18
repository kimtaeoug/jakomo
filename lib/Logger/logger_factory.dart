import 'package:logger/logger.dart';

class LoggerFactory{
  static final LoggerFactory loggerFactory = LoggerFactory._init();
  LoggerFactory._init();
  factory LoggerFactory() => loggerFactory;
  final Logger logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true
    )
  );
  //상세모드
  logV(String input) => logger.v(input);
  //디버그 모드
  logD(String input) => logger.d(input);
  //정보 모드
  logI(String input) => logger.i(input);
  //경고 모드
  logW(String input) => logger.w(input);
  //에러 모드
  logE(String input) => logger.e(input);
  //what the fuck 모드
  logWtf(String input) => logger.wtf(input);
}