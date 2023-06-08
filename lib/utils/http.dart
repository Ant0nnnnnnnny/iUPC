import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpUtils {
  static final HttpUtils _instance = HttpUtils._internal();

  late Map<String, String> _headers;
  late BaseOptions _baseOptions;
  late Dio _dio;

  // Header 中的host
  Map<String, String> hosts = {'eduSys': "jwxt.upc.edu.cn"};
  // 登录请求用的sessionId
  late String sessionId = '';
  // 登录请求用的cookie
  late String cookie = '';
  late String keyDcpV6;

  ///TODO: Finish other request url.
  static const String postLoginUrl = 'http://cas.upc.edu.cn/cas/login';
  static const String getClassInfo = '/xx/xx';
  static const postEduSysUrl =
      "http://cas.upc.edu.cn/cas/login?service=http%3A%2F%2Fjwxt.upc.edu.cn%2Fneusoftcas.jsp";
  final String getInfo = '/xx/xx';
  static const String getLTUrl = 'http://cas.upc.edu.cn/cas/login';

  // 工厂方法
  factory HttpUtils() {
    return _instance;
  }
  // 私有构造函数
  HttpUtils._internal() {
    ///TODO: Finish header information.
    _headers = {
      "Cache-Control": "max-age=0",
      "Upgrade-Insecure-Requests": "1",
      "User-Agent":
          "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.91 Safari/537.36",
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
      "Referer": "http://cas.upc.edu.cn/",
      "Accept-Encoding": "gzip, deflate",
      "Accept-Language": "zh-CN,zh;q=0.9",
      "Connection": "close"
    };
    _baseOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: _headers);

    _dio = Dio(_baseOptions);
  }
  static bool checkToken() {
    ///TODO: Finish function.
    return false;
  }

  static Future<int?> login(String params) async {
    updateCookie();

  }

  static Future<int?> loginAffairSys(String params) async {
    var response = await _instance._dio.post(postEduSysUrl,
        data: params,
        options: Options(headers: {"Host": _instance.hosts['eduSys']}));
    return response.statusCode;
  }

  static Future<String> getLoginHtml() async {
    var response = await _instance._dio.get(getLTUrl);
    return response.data;
  }

  static Future<void> updateCookie() async {
    var response = await _instance._dio.get(getLTUrl);
    _instance.sessionId = response.headers.map['set-cookie']!.length>=2?response.headers.map['set-cookie']![1]: _instance.sessionId;
    response.headers.map['set-cookie']?.forEach((element) {
      _instance.cookie += "${_instance.cookie};$element";
    });
    _instance._baseOptions.headers['cookie'] =  _instance.cookie;
    debugPrint("cookie:${_instance.cookie}");
    debugPrint("sessionId:${_instance.sessionId}");
  }

  static void handleError(int statusCode) {
    switch (statusCode) {
      case 500:
        break;
    }
  }
}
