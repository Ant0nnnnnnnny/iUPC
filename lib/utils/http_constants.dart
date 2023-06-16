class Headers{

  static const Map<String, String> affairSystemBaseHeader = {
    "Host": "jwxt.upc.edu.cn",
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

  static const Map<String, String> hotServicesBaseHeaders = {
    'Host': 'app.upc.edu.cn',
    'Connection': 'keep-alive',
    'sec-ch-ua':
    '"Google Chrome";v="107", "Chromium";v="107", "Not=A?Brand";v="24"',
    'Accept': 'application/json, text/javascript, */*; q=0.01',
    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    "X-Requested-With": 'X-Requested-With',
    'sec-ch-ua-mobile': '?0',
    'User-Agent':
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36',
    'sec-ch-ua-platform': '"Windows"',
    'Origin': 'https://app.upc.edu.cn',
    'Sec-Fetch-Site': 'Sec-Fetch-Site',
    'Sec-Fetch-Mode': 'cors',
    'Sec-Fetch-Dest': 'empty',
    'Referer':
    'https://app.upc.edu.cn/uc/wap/login?redirect=https%3A%2F%2Fapp.upc.edu.cn%2Fappsquare%2Fwap%2Fdefault%2Findex%3Fsid%3D4',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'zh-CN,zh;q=0.9'
  };

  static const Map<String, String> classScheduleBaseHeaders = {
    'Accept': 'application/json, text/plain, */*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6',
    'Connection': 'keep-alive',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Host': 'app.upc.edu.cn',
    'Origin': 'https://app.upc.edu.cn',
    'Referer': 'https://app.upc.edu.cn/site/weekschedule/index',
    'Sec-Fetch-Dest': 'empty',
    'Sec-Fetch-Mode': 'cors',
    'Sec-Fetch-Site': 'same-origin',
    'User-Agent':
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.35',
    'X-Requested-With': 'XMLHttpRequest',
    'sec-ch-ua':
    '"Microsoft Edge";v="113", "Chromium";v="113", "Not-A.Brand";v="24"',
    'sec-ch-ua-mobile': '?0',
    'sec-ch-ua-platform': '"Windows"'
  };

  static const Map<String, String> livingElectricityHeaders = {
    "Host": "dfcz.upc.edu.cn",
    "Proxy-Connection": "keep-alive",
    "Cache-Control": "max-age=0",
    "Upgrade-Insecure-Requests": "1",
    "Origin": "http://dfcz.upc.edu.cn",
    "Content-Type": "application/x-www-form-urlencoded",
    "User-Agent":
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36",
    "Accept":
    "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
    "Referer":
    "http://dfcz.upc.edu.cn/ShiYou/Default.aspx?code=uqioHvE4WDJrDXhnUAPreX5wDY9-mGrkjntmZOOW9eQ&state=STATE",
    "Accept-Encoding": "gzip, deflate",
    "Accept-Language": "zh-CN,zh;q=0.9",
  };

}

class FormBody{

  static const Map<String, String> livingElectricityData = {
    "__VIEWSTATE":
    "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",
    "__VIEWSTATEGENERATOR": "2A6178C9",
    "__EVENTVALIDATION":
    "/wEdADHV1ScoryV/exbHOfcv2qfuciSO0eblAjNiOyMJvhERh8g0cLcy1HkEyE//o8NpI68Tqo4PWi9WlAxvOPs3Z8FlttYAwjuUDFOpDcny3bbvrFytnZTIO1G1vq2mP3Fqsql3Eqv0lDmQ+MqRBjifloFc3dyYduLlYtMgano67Cf2EGm17suCjg/cP5zBe+0weN64dClm40YrasFTHgpXJJ/24817XGZOKxTOHeGtOrc69y10NEXTK3nXSGBfpA/e3cb8SXL4ozPg/H0y/XJe6aAjjl9XWtSdw+3wgoxhRCiyPkynoZYHMfkQCXuPetkRJaacsV205eWAERkqSBBYDNb+P/SIx77oMlUbhVrxpziiv3eWVd4KyL6VAwsGlUPx9FjBfgVTM7l4amSGInVrH5u/qNvQmxm/8ml/6XH6inhTIQZyzoRUf1YIo2Ol6h9DEEghH8WHUklvPqoc6BroTiyzaeJ+LoXYOEFcT/ZkCWmhKOQiQbzQ/uEKT/XZUv8LIuOAWRxUeUgP08yY4qH9eN2J/sXTUD+iV18Q82wX5hBOOKCtQ577tb/J/I30OxTZZSPzR0Tsh5zwHPcsHrMhTKI9R4XKOPLU9Wbc1ivlWDdRA7qsizF0GfRfSzM5/71+nQHbOgdacv01mTxP/6gIpPkX3KlVo6TwjlGcWdhJmnJGJOY0ynznctoZRpwFkrTLRInGL+Vj1dyh3Q9m+s2vSeFrgkNdcExn7IGpFPksmdNkiTwheCssQ3PBd3Le+BvgeiHmRryKhyH1el/PylJrnw+wbpli97Gqb0G15TiMvdE2GmrAkdIWwfN3Eo1+S6FgiOCfD0/rXOhPRRbmg5CvVw4F379khLm46wtCyYCo46y34P8k+2zVpk7P54SBBD56pkAsoTSoeo5Nc1pn1Z0O8VGMMAJlex5SmJSUNJREIsNoQV9XC7A4hwnvgIHWX+K0vBPLOO+Ac6dahnQ0HzPqCYYLRfVp4QM87PZl0DKYmNksU9r9AoZZYsWkwEmut/kv9DGHbyknVdszY+fFgKMx8o6vKXwayjA2jolXLdBzoW6O9/dhGWxQZ3ccwbQqUixPxbk=",
    "chaxun": "查询",
  };

}
