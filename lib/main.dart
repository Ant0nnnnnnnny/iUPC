import 'package:flutter/material.dart';
import 'package:iupc/global_state.dart';
import 'package:get/get.dart';
import 'package:iupc/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
  }

  // 切换夜间模式
  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
      Get.find<GlobalState>().lightMode.value = useLightMode;
    });
  }

  // 切换主题
  void handleColorSelect(int value) {
    setState(() {
      Get.find<GlobalState>().prefs.setString(StorageKey.appColorScheme.value,colorSelected.label);
      colorSelected = ColorSeed.values[value];
    });
  }
  bool useMaterial3 = true;
  ThemeMode themeMode = ThemeMode.system;
  ColorSeed colorSelected = ColorSeed.baseColor;
  // 默认是否夜间模式跟随系统
  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return View.of(context).platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iUPC',
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: useMaterial3,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: useMaterial3,
        brightness: Brightness.dark,
      ),
      home: SplashPage(
              useLightMode: useLightMode,
              useMaterial3: useMaterial3,
              colorSelected: colorSelected,
              handleBrightnessChange: handleBrightnessChange,
              handleColorSelect: handleColorSelect,
            )
    );
  }
}
