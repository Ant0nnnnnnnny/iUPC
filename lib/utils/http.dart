import 'package:dio/dio.dart';

class HttpUtils {

  static final HttpUtils _instance = HttpUtils._internal();

  late String token;
  late Map<String, String> _headers;
  late BaseOptions _baseOptions;
  late Dio _dio;

  ///TODO: Finish other request url.
  static const String postLoginUrl = '/xx/xx';
  static const  String getClassInfo = '/xx/xx';
  final String getInfo = '/xx/xx';

  // 工厂方法
  factory HttpUtils() {
    return _instance;
  }
  // 私有构造函数
  HttpUtils._internal() {

    ///TODO: Finish header information.
    _headers = {'user-agent': 'any', 'x  ': '', 'authorization': 'token'};
    _baseOptions = BaseOptions(

        ///TODO: Finish base url.
        baseUrl: 'http://TBD/',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: _headers);

    _dio = Dio(_baseOptions);
  }
  static bool checkToken(){
    ///TODO: Finish function.
    return false;
  }
}
