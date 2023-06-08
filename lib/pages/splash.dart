import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iupc/utils/account_encode.dart';

import '../constants.dart';
import '../global_state.dart';
import '../utils/http.dart';
import 'home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.useLightMode,
    required this.useMaterial3,
    required this.colorSelected,
    required this.handleBrightnessChange,
    required this.handleColorSelect,
  });

  final bool useLightMode;
  final bool useMaterial3;
  final ColorSeed colorSelected;
  final void Function(bool useLightMode) handleBrightnessChange;
  final void Function(int value) handleColorSelect;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  late final AnimationController _upController;
  late final Animation<Offset> _upMoveAnimation;

  late final AnimationController _downController;
  late final Animation<Offset> _downMoveAnimation;

  late final AnimationController _midController;
  late final Animation<Offset> _midMoveAnimation;

  late final SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    initialize();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _downController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _upController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _midController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _upMoveAnimation = Tween<Offset>(
      begin: Offset(Random().nextDouble(), Random().nextDouble()),
      end: Offset(Random().nextDouble(), Random().nextDouble()),
    ).animate(
      CurvedAnimation(
        parent: _midController,
        curve: Curves.linear,
      ),
    );
    _midMoveAnimation = Tween<Offset>(
      begin: Offset(Random().nextDouble(), Random().nextDouble()),
      end: Offset(Random().nextDouble(), Random().nextDouble()),
    ).animate(

      CurvedAnimation(
        parent: _upController,
        curve: Curves.linear,
      ),
    );
    _downMoveAnimation = Tween<Offset>(
      begin: Offset(Random().nextDouble(), Random().nextDouble()),
      end: Offset(Random().nextDouble(), Random().nextDouble()),
    ).animate(
      CurvedAnimation(
        parent: _upController,
        curve: Curves.linear,
      ),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    );
    _downController.forward();
    _upController.forward();

    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _downController.dispose();
    _upController.dispose();
    _midController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Column(
          children: [
            SlideTransition(
              position: _upMoveAnimation,
              child: Container(
                width: 256,
                height: 256,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(256)),
              ),
            ), SlideTransition(
              position: _downMoveAnimation,
              child: Container(
                width: 256,
                height: 256,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(256)),
              ),
            ),SlideTransition(
              position: _midMoveAnimation,
              child: Container(
                width: 256,
                height: 256,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(256)),
              ),
            ),
          ],
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Hero(
                tag: 'app_title',
                child: Text(
                  'i石大',
                  style: Theme.of(context).textTheme.displayMedium,
                )),
            const Spacer(),
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: -1,
              child: Text(
                '校园生活得力助手',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        )),
      ],
    )));
  }

  Future<void> initialize() async {
    // 初始化全局状态，含有异步操作
    Get.put(GlobalState());
    // 初始化单例
    HttpUtils();
    AccountEncode();
    HttpUtils.updateCookie();

    // 延时一下，等待异步加载操作完成
    Future.delayed(const Duration(milliseconds: 500),(){
      prefs = Get.put(GlobalState()).prefs;
      // 初始化存储变量
      debugPrint('Initialize theme...');
      if(prefs.containsKey(StorageKey.appColorScheme.value)){
        setState(() {
          widget.handleColorSelect(ColorSeed.values.indexWhere((element) => element.label==prefs.getString(StorageKey.appColorScheme.value)));
        });
      }else{
        debugPrint('Create theme storage');
        prefs.setString(StorageKey.appColorScheme.value,widget.colorSelected.label);
      }

      //判断是否已经打开过App

      //若未打开，则显示引导页
      if(!prefs.containsKey(StorageKey.appHasOpened.value)){

        ///TODO: 引导界面 OnBoardingPage
        debugPrint('First time to open app, navigate to onboard page.');
        prefs.setBool(StorageKey.appHasOpened.value, true);
        Future.delayed(const Duration(seconds: 3), () {

          Get.off(() => HomePage(
            key: UniqueKey(),
            useLightMode: widget.useLightMode,
            useMaterial3: widget.useMaterial3,
            colorSelected: widget.colorSelected,
            handleBrightnessChange: widget.handleBrightnessChange,
            handleColorSelect: widget.handleColorSelect,
          ));
        });
      }
      //否则直接进入App主页
      else{

        debugPrint('Second time to open app, launch main page directly.');
        Future.delayed(const Duration(seconds: 3), () {
          Get.off(() => HomePage(
            key: UniqueKey(),
            useLightMode: widget.useLightMode,
            useMaterial3: widget.useMaterial3,
            colorSelected: widget.colorSelected,
            handleBrightnessChange: widget.handleBrightnessChange,
            handleColorSelect: widget.handleColorSelect,

          ));
        });
      }
    });
  }
}
