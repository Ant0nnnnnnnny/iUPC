import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FrequentFunctionPage extends StatelessWidget {
  final double width;
  FrequentFunctionPage({Key? key, required this.width}) : super(key: key);

  final logic = Get.put(FrequentFunctionLogic());
  final state = Get.find<FrequentFunctionLogic>().state;

  @override
  Widget build(BuildContext context) {
    final boarderColor = Theme.of(context).colorScheme.outline;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '快捷入口',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: boarderColor),
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(width * 0.1),
                  bottomLeft: Radius.circular(width * 0.1))),
          child: Column(
            children: [
              _generateFunctionButton(
                  Icons.cast_for_education, '软件工程', FrequentFunctionPage(width: 1), context),
              _generateFunctionButton(
                  Icons.edit, '神经网络与深度学习', FrequentFunctionPage(width: 1), context),
              _generateFunctionButton(
                  Icons.home_work, '神经网络与深度学习', FrequentFunctionPage(width: 1), context),
              _generateFunctionButton(
                  Icons.schedule, '完整课表', FrequentFunctionPage(width: 1), context)
            ],
          ),
        ),
      ],
    );
  }

  Widget _generateFunctionButton(
      IconData icon, String text, Widget page, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16,right: 4,top: 8,bottom: 8),
      child: InkWell(
        onTap: (){

          debugPrint(text);
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8,right: 4),
                  child: Center(
                      child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium,
            )),
                )),
            Icon(Icons.arrow_right_rounded,
                color: Theme.of(context).colorScheme.primary)
          ],
        ),
      ),
    );
  }
}
