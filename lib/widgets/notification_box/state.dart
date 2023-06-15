import 'package:flutter/material.dart';
import 'package:iupc/pages/login/view.dart';

import '../../entities/notification_entity.dart';

class NotificationBoxState {
  late List<NotificationEntity> informationList;


  ///TODO Finish local storage.
  late List<NotificationEntity> pinnedInformationList = [];

  NotificationBoxState() {
    ///TODO: TEST MODE
    informationList = [];
    informationList.add(NotificationEntity(
        title: '考试',
        context: '神经网络与深度学习',
        page: const LoginPage(),
        icon: const Icon(Icons.edit)));
    informationList.add(NotificationEntity(
        title: '考试',
        context: '神经网络与深度学习',
        page: const LoginPage(),
        icon: const Icon(Icons.edit)));
    informationList.add(NotificationEntity(
        title: '考试',
        context: '神经网络与深度学习',
        page: const LoginPage(),
        icon: const Icon(Icons.edit)));
    informationList.add(NotificationEntity(
        title: '考试',
        context: '神经网络与深度学习',
        page: const LoginPage(),
        icon: const Icon(Icons.edit)));
  }


}
