// import 'dart:convert';
//
// import 'dart:http/http.dart' as http;
// import 'package:html/parser.dart' as html;
// import 'package:html/dom.dart';
//
// class USER {
//   bool jwxt = false; // 教务系统
//   bool rmfw = false; // 微信热门服务
//   String jwxtCookie = "";
//   String rmfwCookie = "";
//   String account = "";
//   String password = "";
//
//   USER(this.account, this.password);
//
//   //登录教务系统
//   Future<bool> loginJWXT() async {
//     jwxt = true;
//     if (jwxt) {
//       // 如果已经登录
//       return true;
//     }
//     //第一次请求获取lt和execution的数值
//     Map<String, String> header = {
//       "User-Agent":
//           'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36'
//     };
//     String loginUrl =
//         """http://cas.upc.edu.cn/cas/login?service=http%3A%2F%2Fjwxt.upc.edu.cn%2Fneusoftcas.jsp""";
//     var session = http.Client();
//     var one = await session.get(Uri.parse(loginUrl));
//     var loginPageHtml = html.parse(one.body);
//
//     var lt = loginPageHtml.querySelector('#lt')!.attributes['value']!;
//     var execution =
//         loginPageHtml.querySelector('[name="execution"]')!.attributes['value']!;
//     String u = '2009050216';
//     String p = '20020528lykLYK.';
//     int ul = u.length;
//     int pl = p.length;
//     String eventId = "submit";
//
//     //第二次请求提交相应信息
//     //加密
//     Map<String, String> data = {
//       "rsa":
//           'E51307327907D5FDE966FB6059BEB6D49FAE68ADF3C397EB22ABEF1DDD95AB65DEB26233E1CD73C866C2DF207D512FEBADEAD92C8C31C92B460C5A36B6CBE6A9506FB9A1018E5B7BB656022CEE29D4585914FB0BABB2F9B37E93B707C62504A451F25BDAF414BA53857BDCB85D6EB3D3F883511FC831E95B7A1DAB22568E38988E5512EEA0F3D646B2DA8880EA270330',
//       "ul": '10',
//       "pl": '15',
//       "lt": 'LT-499689-4q5UY9YgqIzofxch3sTwzpzUTJFFe0-cas',
//       "execution": 'e1s1',
//       "_eventId": eventId
//     };
//
//     var two = await session.post(Uri.parse(loginUrl), body: data);
//     String nextUrl = two.headers['location'].toString();
//
//     //第三次请求进行对应跳转，获取教务系统相关cookie
//     header = header = {
//       "Host": "jwxt.upc.edu.cn",
//       "Cache-Control": "max-age=0",
//       "Upgrade-Insecure-Requests": "1",
//       "User-Agent":
//           "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.91 Safari/537.36",
//       "Accept":
//           "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
//       "Referer": "http://cas.upc.edu.cn/",
//       "Accept-Encoding": "gzip, deflate",
//       "Accept-Language": "zh-CN,zh;q=0.9",
//       "Connection": "close"
//     };
//     var three = await session.post(Uri.parse(nextUrl), headers: header);
//     var cookie = three.headers['set-cookie'].toString();
//
//     //第四次请求
//     header = {
//       "Host": "jwxt.upc.edu.cn",
//       "Upgrade-Insecure-Requests": "1",
//       "User-Agent":
//           "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.91 Safari/537.36",
//       "Accept":
//           "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
//       "Referer":
//           "http://jwxt.upc.edu.cn/neusoftcas.jsp;jsessionid=CE5776D8CDC09AAEE6177DBF430760C7",
//       "Accept-Encoding": "gzip, deflate",
//       "Accept-Language": "zh-CN,zh;q=0.9",
//       "Cookie": cookie,
//       "Connection": "close",
//     };
//     var four = await session.post(Uri.parse(nextUrl), headers: header);
//     var fiveUrl = four.headers['Location'].toString();
//
//     // 第五次请求
//     header = {
//       "Host": "jwxt.upc.edu.cn",
//       "Upgrade-Insecure-Requests": "1",
//       "User-Agent":
//           "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.91 Safari/537.36",
//       "Accept":
//           "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
//       "Referer":
//           "http://jwxt.upc.edu.cn/neusoftcas.jsp;jsessionid=CE5776D8CDC09AAEE6177DBF430760C7",
//       "Accept-Encoding": "gzip, deflate",
//       "Accept-Language": "zh-CN,zh;q=0.9",
//       "Cookie": cookie,
//       "Connection": "close",
//     };
//     var five = await session.post(Uri.parse(fiveUrl), headers: header);
//     jwxtCookie = cookie;
//     jwxt = true;
//     return true;
//   }
//
//   //登录热门服务
//   Future<bool> loginRMFW() async {
//     if (rmfw && rmfwCookie != "") {
//       // 如果已经登录
//       return true;
//     }
//     // 登录热门服务
//     Map<String, String> loginHead = {
//       'Host': 'app.upc.edu.cn',
//       'Connection': 'keep-alive',
//       'sec-ch-ua':
//           '"Google Chrome";v="107", "Chromium";v="107", "Not=A?Brand";v="24"',
//       'Accept': 'application/json, text/javascript, */*; q=0.01',
//       'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
//       "X-Requested-With": 'X-Requested-With',
//       'sec-ch-ua-mobile': '?0',
//       'User-Agent':
//           'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',
//       'sec-ch-ua-platform': '"Windows"',
//       'Origin': 'https://app.upc.edu.cn',
//       'Sec-Fetch-Site': 'Sec-Fetch-Site',
//       'Sec-Fetch-Mode': 'cors',
//       'Sec-Fetch-Dest': 'empty',
//       'Referer':
//           'https://app.upc.edu.cn/uc/wap/login?redirect=https%3A%2F%2Fapp.upc.edu.cn%2Fappsquare%2Fwap%2Fdefault%2Findex%3Fsid%3D4',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Accept-Language': 'zh-CN,zh;q=0.9'
//     };
//     Map<String, String> data = {'username': account, 'password': password};
//
//     var post1 = await http.post(
//         Uri.parse('https://app.upc.edu.cn/uc/wap/login/check'),
//         headers: loginHead,
//         body: data);
//     if (post1.body.contains("操作成功")) {
//       // 登录成功
//       rmfw = true;
//       rmfwCookie = post1.headers['set-cookie'].toString();
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   //热门服务-课表
//   Future<Map<String, dynamic>> timetable(
//       {String year = '2022-2023',
//       String term = '2',
//       String week = '2',
//       String tpe = '2'}) async {
//     if (!rmfw || rmfwCookie == '') {
//       return {};
//     }
//
//     Map<String, String> header = {
//       'Accept': 'application/json, text/plain, */*',
//       'Accept-Encoding': 'gzip, deflate, br',
//       'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6',
//       'Connection': 'keep-alive',
//       'Content-Type': 'application/x-www-form-urlencoded',
//       'Cookie': rmfwCookie,
//       'Host': 'app.upc.edu.cn',
//       'Origin': 'https://app.upc.edu.cn',
//       'Referer': 'https://app.upc.edu.cn/site/weekschedule/index',
//       'Sec-Fetch-Dest': 'empty',
//       'Sec-Fetch-Mode': 'cors',
//       'Sec-Fetch-Site': 'same-origin',
//       'User-Agent':
//           'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.35',
//       'X-Requested-With': 'XMLHttpRequest',
//       'sec-ch-ua':
//           '"Microsoft Edge";v="113", "Chromium";v="113", "Not-A.Brand";v="24"',
//       'sec-ch-ua-mobile': '?0',
//       'sec-ch-ua-platform': '"Windows"'
//     };
//     Map<String, String> body = {
//       'year': year,
//       'term': term,
//       'week': week,
//       'type': tpe,
//     };
//     final response = await http.post(
//         Uri.parse('https://app.upc.edu.cn/timetable/wap/default/get-datatmp'),
//         headers: header,
//         body: body);
//
//     String html = response.body;
//     final temp = json.decode(html);
//     if (temp['m'] != '操作成功') {
//       return {};
//     }
//     return temp;
//   }
//
//   //教务系统-学期理论课表
//   Future<List<List<Map<String, String>>>> theoreticalTimetable(
//       {yearAndTerm = '2020-2021-1'}) async {
//     Map<String, String> header = {
//       "Host": "jwxt.upc.edu.cn",
//       "Upgrade-Insecure-Requests": "1",
//       "User-Agent":
//           "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.91 Safari/537.36",
//       "Accept":
//           "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
//       "Referer": "http://jwxt.upc.edu.cn/jsxsd/framework/xsMain.jsp",
//       "Accept-Encoding": "gzip, deflate",
//       "Accept-Language": "zh-CN,zh;q=0.9",
//       "Cookie": jwxtCookie,
//       "Connection": "close"
//     };
//     Map<String, String> body = {
//       'cj0701id': '&zc=&demo=',
//       'xnxq01id': yearAndTerm
//     };
//     final response = await http.post(
//         Uri.parse(
//             'http://jwxt.upc.edu.cn/jsxsd/xskb/xskb_list.do?Ves632DSdyV=NEW_XSD_PYGL'),
//         headers: header,
//         body: body);
//
//     var hml = response.body;
//     //进行解析
//     var soup = html.parse(hml);
//     var classesTemp = soup.querySelectorAll('tr'); // 第一到第五大节
//     var classes = classesTemp.sublist(2, 7);
//     var res = [];
//     List<List<Map<String, String>>> result = List.generate(
//       5,
//       (_) => List.filled(7, {}, growable: false),
//       growable: false,
//     );
//     for (var i in classes) {
//       res.add(i.querySelectorAll('td'));
//     }
//     // 对每个单元进行解析
//     for (var i = 0; i < res.length; i++) {
//       for (var j = 0; j < res[0].length; j++) {
//         var tempText = res[i][j].text.split('\n');
//         var tempList = [];
//         for (var line in tempText) {
//           line = line.toString().replaceAll("\t", "");
//           if (line != '') {
//             tempList.add(line);
//           }
//         }
//         if (tempList.length != 2) {
//           result[i][j] = {"": ""};
//           continue;
//         }
//         Map<String, String> tempDict = {};
//         var line1 = tempList[0].split('----------------');
//         var line2 = tempList[1].split('---------------------');
//         var count = line1.length;
//         for (var flag = 0; flag < count; flag++) {
//           tempDict[line1[flag].toString()] = line2[flag].toString();
//         }
//         String tempString = tempDict.toString();
//         result[i][j] = tempDict;
//       }
//     }
//     return result;
//   }
//
//   //教务系统-成绩
//   Future<List<List<String>>> grade({yearAndTerm = '2020-2021-1'}) async {
//     String gradeUrl = """http://jwxt.upc.edu.cn/jsxsd/kscj/cjcx_list""";
//     Map<String, String> header = {
//       "Host": "jwxt.upc.edu.cn",
//       "Cache-Control": "max-age=0",
//       "Upgrade-Insecure-Requests": "1",
//       "Origin": "http://jwxt.upc.edu.cn",
//       "Content-Type": "application/x-www-form-urlencoded",
//       "User-Agent":
//           "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.5735.91 Safari/537.36",
//       "Accept":
//           "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
//       "Referer":
//           "http://jwxt.upc.edu.cn/jsxsd/kscj/cjcx_query?Ves632DSdyV=NEW_XSD_XJCJ",
//       "Accept-Encoding": "gzip, deflate",
//       "Accept-Language": "zh-CN,zh;q=0.9",
//       "Cookie": jwxtCookie,
//       "Connection": "close",
//     };
//
//     Map<String, String> data = {
//       'kksj': yearAndTerm, // 选择学期
//       'xsfs': 'all'
//     };
//     var response =
//         await http.post(Uri.parse(gradeUrl), headers: header, body: data);
//     var hml = response.body;
//     var soup = html.parse(hml);
//     List<List<String>> result = []; //最终结果存放
//     var trs = soup.querySelectorAll('tr');
//     // 表头处理
//     List<String> line = [];
//     for (var th in trs[1].querySelectorAll('th')) {
//       line.add(th.text);
//     }
//     result.add(line);
//     //内容处理
//     trs = trs.sublist(2);
//     for (var tr in trs) {
//       line = [];
//       var tds = tr.querySelectorAll('td');
//       for (var td in tds) {
//         line.add(td.text);
//       }
//       result.add(line);
//     }
//     return result;
//   }
//
//   //直接查询-电费
//   Future<String> getEle(
//       {String lou = '18号楼空调(58)', String room = '833'}) async {
//     Map<String, String> header = {
//       "Host": "dfcz.upc.edu.cn",
//       "Proxy-Connection": "keep-alive",
//       "Cache-Control": "max-age=0",
//       "Upgrade-Insecure-Requests": "1",
//       "Origin": "http://dfcz.upc.edu.cn",
//       "Content-Type": "application/x-www-form-urlencoded",
//       "User-Agent":
//           "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36",
//       "Accept":
//           "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
//       "Referer":
//           "http://dfcz.upc.edu.cn/ShiYou/Default.aspx?code=uqioHvE4WDJrDXhnUAPreX5wDY9-mGrkjntmZOOW9eQ&state=STATE",
//       "Accept-Encoding": "gzip, deflate",
//       "Accept-Language": "zh-CN,zh;q=0.9",
//     };
//     Map<String, String> data = {
//       "__VIEWSTATE":
//           "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",
//       "__VIEWSTATEGENERATOR": "2A6178C9",
//       "__EVENTVALIDATION":
//           "/wEdADHV1ScoryV/exbHOfcv2qfuciSO0eblAjNiOyMJvhERh8g0cLcy1HkEyE//o8NpI68Tqo4PWi9WlAxvOPs3Z8FlttYAwjuUDFOpDcny3bbvrFytnZTIO1G1vq2mP3Fqsql3Eqv0lDmQ+MqRBjifloFc3dyYduLlYtMgano67Cf2EGm17suCjg/cP5zBe+0weN64dClm40YrasFTHgpXJJ/24817XGZOKxTOHeGtOrc69y10NEXTK3nXSGBfpA/e3cb8SXL4ozPg/H0y/XJe6aAjjl9XWtSdw+3wgoxhRCiyPkynoZYHMfkQCXuPetkRJaacsV205eWAERkqSBBYDNb+P/SIx77oMlUbhVrxpziiv3eWVd4KyL6VAwsGlUPx9FjBfgVTM7l4amSGInVrH5u/qNvQmxm/8ml/6XH6inhTIQZyzoRUf1YIo2Ol6h9DEEghH8WHUklvPqoc6BroTiyzaeJ+LoXYOEFcT/ZkCWmhKOQiQbzQ/uEKT/XZUv8LIuOAWRxUeUgP08yY4qH9eN2J/sXTUD+iV18Q82wX5hBOOKCtQ577tb/J/I30OxTZZSPzR0Tsh5zwHPcsHrMhTKI9R4XKOPLU9Wbc1ivlWDdRA7qsizF0GfRfSzM5/71+nQHbOgdacv01mTxP/6gIpPkX3KlVo6TwjlGcWdhJmnJGJOY0ynznctoZRpwFkrTLRInGL+Vj1dyh3Q9m+s2vSeFrgkNdcExn7IGpFPksmdNkiTwheCssQ3PBd3Le+BvgeiHmRryKhyH1el/PylJrnw+wbpli97Gqb0G15TiMvdE2GmrAkdIWwfN3Eo1+S6FgiOCfD0/rXOhPRRbmg5CvVw4F379khLm46wtCyYCo46y34P8k+2zVpk7P54SBBD56pkAsoTSoeo5Nc1pn1Z0O8VGMMAJlex5SmJSUNJREIsNoQV9XC7A4hwnvgIHWX+K0vBPLOO+Ac6dahnQ0HzPqCYYLRfVp4QM87PZl0DKYmNksU9r9AoZZYsWkwEmut/kv9DGHbyknVdszY+fFgKMx8o6vKXwayjA2jolXLdBzoW6O9/dhGWxQZ3ccwbQqUixPxbk=",
//       "lou": lou,
//       "yonghu": room,
//       "chaxun": "查询",
//     };
//     var response = await http.post(
//         Uri.parse(
//             'http://dfcz.upc.edu.cn/ShiYou/Default.aspx?code=uqioHvE4WDJrDXhnUAPreX5wDY9-mGrkjntmZOOW9eQ&state=STATE'),
//         headers: header,
//         body: data);
//     String text = response.body;
//     RegExp exp = RegExp('<td>(.*?)度</td>');
//     var ele = exp.firstMatch(text)?.group(0);
//     return ele.toString();
//   }
//
// //直接查询-空闲教室
// }
//
// Future<void> main() async {
//   USER user = USER('2009050216', '20020528lykLYK.');
//   var flag1 = await user.loginRMFW();
//   var flag2 = await user.loginJWXT();
//   // //热门服务-课表
//   // var res = await user.timetable(year: '2022-2023', week: '10', term: '1');
//   // print(res);
//   //
//   // //教务系统-学期理论课表
//   // var res1 = await user.theoreticalTimetable(yearAndTerm: '2020-2021-2');
//   // for (var i = 0; i < res1.length; i++) {
//   //   for (var j = 0; j < res1[0].length; j++) {
//   //     //# 第一个空为第几大节课  0-第一大节  1-第二大节
//   //     //# 第二个空为第几周      0-周日     1-周一     6-周六
//   //     // # res[0][1] 表示 第一大节课 周一
//   //     print('课次：$i ,周次：$j');
//   //     print(res1[i][j]);
//   //   }
//   // }
//   // //教务系统-成绩
//   // var grade = await user.grade(yearAndTerm: '2020-2021-1');
//
//   //电费查询
//   var ele = await user.getEle(lou:'18号楼空调(58)',room: '833');
//   print(ele);
// }
