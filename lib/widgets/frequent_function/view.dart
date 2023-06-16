import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'logic.dart';

class FrequentFunctionPage extends StatelessWidget {
  final double width;
  FrequentFunctionPage({Key? key, required this.width}) : super(key: key);

  final logic = Get.put(FrequentFunctionLogic());
  final state = Get.find<FrequentFunctionLogic>().state;


  @override
  Widget build(BuildContext context) {
    final boarderColor = Theme.of(context).colorScheme.outline;
    state.functionList =[_generateFunctionButton(Icons.cast_for_education, '软件工程',
        FrequentFunctionPage(width: 1), context),
    _generateFunctionButton(Icons.edit, '神经网络与深度学习',
    FrequentFunctionPage(width: 1), context),
    _generateFunctionButton(Icons.home_work, '神经网络与深度学习',
    FrequentFunctionPage(width: 1), context),
    _generateFunctionButton(Icons.schedule, '完整课表',
    FrequentFunctionPage(width: 1), context)];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '快捷入口',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: boarderColor),
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.all(Radius.circular(14))),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: state.functionList.length,
            itemBuilder: (BuildContext context, int index) {
              return state.functionList[index];
            },
            gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
              // childAspectRatio: 0.78,
              maxCrossAxisExtent:  checkIslandScape(context)?128:168,

              // mainAxisExtent: 256,
            ),
          ),
        ),
      ],
    );
  }

  Widget _generateFunctionButton(
      IconData icon, String text, Widget page, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 4, top: 8, bottom: 8),
      child: Card(
        child: InkWell(
          onTap: (){},
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8,8,8,0),
                child: Center(
                child: Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
