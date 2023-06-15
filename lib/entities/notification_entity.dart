import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationEntity{
  final String title;
  final String context;
  final Widget? page;
  final Widget? icon;
  NotificationEntity({required this.title, required this.context, this.page,this.icon});

  void onClick(){
    if(page!=null){
      Get.to(page);
    }
  }
}