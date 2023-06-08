// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// NavigationRail shows if the screen width is greater or equal to
// narrowScreenWidthThreshold; otherwise, NavigationBar is used for navigation.
const double narrowScreenWidthThreshold = 450;

const double mediumWidthBreakpoint = 1000;
const double largeWidthBreakpoint = 1500;

const double transitionLength = 500;

enum ColorSeed {
  baseColor('淡紫', Color(0xff6750a4)),
  indigo('靛蓝', Colors.indigo),
  blue('蓝色', Colors.blue),
  teal('蓝绿', Colors.teal),
  green('绿色', Colors.green),
  yellow('黄色', Colors.yellow),
  orange('橙色', Colors.orange),
  deepOrange('桔黄', Colors.deepOrange),
  pink('粉色', Colors.pink);

  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}

enum ScreenSelected {
  home(0),
  classes(1),
  affairs(2),
  account(3);

  const ScreenSelected(this.value);
  final int value;
}

//  本地存储Key
enum StorageKey{
  // 全局App相关
  appContainerName('app'),  //容器名称
  appColorScheme('app_color_scheme'),
  appHasOpened('app_has_opened');


  const StorageKey(this.value);
  final String value;
}