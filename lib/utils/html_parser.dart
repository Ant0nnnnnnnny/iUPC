import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:iupc/utils/http.dart';

class HtmlParser {

  static final HtmlParser _instance = HtmlParser._internal();
// 工厂方法
  factory HtmlParser() {
    return _instance;
  }
  // 私有构造函数
  HtmlParser._internal() {

  }
  // 获取登录界面的lt
  static Future<String> getLt() async {

    String html = await HttpUtils.getLoginHtml();
    BeautifulSoup bs = BeautifulSoup(html);
    // 截取指定位置的LT
    String lt = bs.find('*',id: 'lt').toString().substring(46,90);
    debugPrint(lt);

    return lt;
  }
}