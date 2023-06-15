import 'package:flutter/material.dart';
import 'package:iupc/widgets/frequent_function/view.dart';
import 'package:iupc/widgets/notification_box/view.dart';
import 'package:iupc/widgets/schedule/view.dart';

import '../../constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth =
    checkIslandScape(context)
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width/2;
    return Expanded(
      child: ListView(
        children: [
          SizedBox(
            width: screenWidth,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SchedulePage(
                  height: 246,
                ),
                const Expanded(child: Text('')),
                FrequentFunctionPage(
                  width: 162,
                ),
              ],
            ),
          ),const NotificationBox(),
          const SizedBox(height: 100,),
        ],
      ),
    );
  }
}
