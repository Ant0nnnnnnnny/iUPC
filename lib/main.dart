import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:iupc/global_state.dart';
import 'package:iupc/pages/home.dart';
import 'package:get/get.dart';
import 'constants.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
@override
  void initState() {
  Get.put(GlobalState());
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
      colorSelected = ColorSeed.values[value];
      Get.find<GlobalState>().themeSeed.value = colorSelected;

    });
  }

  bool useMaterial3 = true;
  ThemeMode themeMode = ThemeMode.system;
  ColorSeed colorSelected = ColorSeed.baseColor;
  // 默认是否夜间模式跟随系统
  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return SchedulerBinding.instance.window.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material 3',
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
      home: HomePage(
        useLightMode: useLightMode,
        useMaterial3: useMaterial3,
        colorSelected: colorSelected,
        handleBrightnessChange: handleBrightnessChange,
        handleColorSelect: handleColorSelect,
      ),
    );
  }
}
