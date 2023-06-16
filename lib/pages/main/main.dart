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
    debugPrint('Width:${MediaQuery.of(context).size.width}');
    final double screenWidth = checkIslandScape(context)
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.width*0.45;
    return checkIslandScape(context)
        ? Expanded(
            child: ListView(
              children: [
                SizedBox(
                  width: screenWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SchedulePage(
                        width: 350,
                      ),
                      const NotificationBox(
                        width: 350,
                      ),
                      FrequentFunctionPage(
                        width: 350,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
        : Row(
          children: [
            SizedBox(
              width: 300,
              child: ListView(
                shrinkWrap: true,
                children: const [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SchedulePage(
                        width: 300,
                      ),
                      NotificationBox(
                        width: 300,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            SizedBox(
              width: screenWidth,
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: screenWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FrequentFunctionPage(
                          width: 250,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        );
  }
}
